function [pts, pts_tilde, A_true, t_true] = affine_test_case(N)

% generating a test case for estimating an affine transformation.
% pts: random point in sourse image 2x1
% pts_tilde = A * pts + t
% t_true: shifting  on x and y axis and it is 2*1 
% A_true: affine transform = 2X2 matrix point
    
    pts = rand([2, N]);     % generating sets of random points
    A_true = rand(2);       % generating a random 2 * 2 matrix
    t_true = rand([2, 1]);  % generating a random 2 * 1 matrix
   
    pts_tilde = A_true * pts + t_true;  % calculating the pts_tilde based on the random model


end