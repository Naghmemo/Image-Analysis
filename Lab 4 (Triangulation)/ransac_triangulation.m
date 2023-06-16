function [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold) 
   
    i = 0;  
    nbr_inliers = 0;
    U = zeros (3, size(Ps, 1));
    P = 0.99;
    k_max = size(Ps, 2) * 1000;
    
    while i <  k_max 
        
        n = randperm(size(Ps, 2), 2);
        % estimate U based on Ps and us
        U_est = minimal_triangulation(Ps(n), us(:,n));
        
        % calculating errors
        errors = reprojection_errors(Ps, us, U_est);
        num_inliers = nnz(errors <= threshold);

        % check the errors are better
        if num_inliers > nbr_inliers
           nbr_inliers = num_inliers;
           U = U_est;
           eps = nbr_inliers / size (Ps,2);
           k_max = log(1-P) / log(1-eps^3);  % update k_max
        end
        i = i + 1;
    end
end