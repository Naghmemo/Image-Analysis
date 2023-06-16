function [A, t] = least_squares_affine(pts, pts_tilde)
    % In our previous estimate_affine function, we consider all of the
    % points, so basically this function is the same as desired function
    % here.
    [A,t] = estimate_affine(pts, pts_tilde);
end