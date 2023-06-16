function warped = align_images_inlier_ls(source, target, threshold, upright)
    % extract SIFT features for source image
    points_source = detectSIFTFeatures(source);
    [features_source, pts_source] = extractFeatures(source,points_source, 'Upright',upright);
    
    % extract SIFT features for target image
    points_target = detectSIFTFeatures(target);
    [features_target, pts_target] = extractFeatures(target,points_target, 'Upright',upright);

    % match features
    corrs = matchFeatures(features_source, features_target, 'MaxRatio', 0.8, 'MatchThreshold', 100);

    pts_source_corr = pts_source(corrs(:, 1),:);
    pts_target_corr = pts_target(corrs(:, 2),:);

   
    C = 3;  % number of coordinates
    i = 0;  
    num_inliers_best = 0;
    A_best = zeros(2);
    t_best = zeros(2,1);
    iteration_max = 1e6;
    P = 0.99;
    k_max = 40000;
    pts = transpose(pts_source_corr.Location);
    pts_tilde = transpose(pts_target_corr.Location);

    while i <= k_max && i < iteration_max

        % generate random pts and pts_tilde
        rand_index_pts = randperm(size(pts,2), C);
        rand_pts = pts(:, rand_index_pts);
        rand_pts_tilde= pts_tilde(:, rand_index_pts);

        % estimate affine (minimal solver) based on the random pts and pts_tilde
        [A_new, t_new] = least_squares_affine(rand_pts, rand_pts_tilde); 
        
        % calculate residual
        pts_cor = A_new * pts + t_new;
        residuals = sum((pts_cor - pts_tilde).^2, 1);
        num_inliers = nnz(residuals <= threshold);

        % Save the current inliners as its own set
        pts_inl = [];
        pts_tilde_inl = []; 
        for idx = 1:length(residuals)
            if (residuals(idx) < threshold)
                pts_inl = [pts_inl pts(:,idx)];
                pts_tilde_inl = [pts_tilde_inl pts_tilde(:,idx)];
            end
        end

        % check for better model, & substitute parameters with new parameters
        if num_inliers > num_inliers_best
           num_inliers_best = num_inliers;
           [A_best, t_best] = least_squares_affine(pts_inl, pts_tilde_inl);
           
           eps = num_inliers_best / length(pts);
           k_max = max(k_max, abs(int32(log(1-P)/log(1-eps.^C))));  % update k_max
        end
        i = i + 1;
    end

    % output the transformation 
    A = A_best;
    t = t_best;

    pts_final = A * pts + t;
    residuals_final = sum((pts_final - pts_tilde).^2, 1);
    num_inliers_final = nnz(residuals_final <= threshold);

    warped = affine_warp(size(target), source, A, t);

    num_inliers
    num_inliers_final
end