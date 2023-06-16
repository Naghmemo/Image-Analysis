function [pts, pts_tilde, A_true, t_true] = affine_test_case_outlier(N ,outlier_rate)
    % calculating the number of outlier points based on outlier rate
    n_outlier = ceil(outlier_rate * N);
    % generating pts and pts_tilde for the whole number of N
    [pts, pts_tilde, A_true, t_true] = affine_test_case(N);
    % change generated pts to outlier points
    for i = 1:n_outlier
        pts_tilde(:,i)=[rand(1)*max(pts_tilde(1,:)); rand(1)*max(pts_tilde(2,:))];
    end

end