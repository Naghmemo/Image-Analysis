function [A,t] = ransac_fit_affine(pts, pts_tilde, threshold)
    C = 3;  % numbere of coordinates
    i = 0;  
    num_inliers_best = 0;
    A = zeros(2);
    t = zeros(2,1);
    iteration_max = 1e6;
    P = 0.99;
    k_max = 40000;
    
    while i <=  k_max && i < iteration_max

        % generate random pts and pts_tilde
        rand_index_pts = randperm(size(pts,2), C);
        rand_pts = pts(:, rand_index_pts);
        rand_pts_tilde= pts_tilde(:, rand_index_pts);


%         index_range = linspace (1, length(pts), length(pts));
%         rand_index_pts = datasample(index_range, 3, 'Replace',false);
%         rand_pts = pts(:, rand_index_pts);
%         rand_pts_tilde= pts_tilde(:, rand_index_pts);

        % estimate affine (minimal solver) based on the random ptas nad pts_tilde
        [A_new, t_new] = estimate_affine(rand_pts, rand_pts_tilde); 
        
        % calculating Residual
        pts_cor = A_new * pts + t_new;
        residuals = sum((pts_cor - pts_tilde).^2, 1);
        num_inliers = nnz(residuals <= threshold);


        % check for better model, & substitute parameters with new parameters
        if num_inliers > num_inliers_best
           num_inliers_best = num_inliers;
           A = A_new;
           t = t_new;
           eps = num_inliers_best / length (pts);
           k_max =max(k_max,abs(int32(log(1-P)/log(1-eps.^3))));  % update k_max
        end
        i = i +1;
    end
    disp(['Number of inliers: ' num2str(num_inliers_best)])
    disp(['Mean residual: ' num2str(mean(residuals))])
end