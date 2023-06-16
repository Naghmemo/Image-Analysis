function res = residual_lgths(A, t, pts, pts_tilde)

    pts_cor = A * pts + t;

    res = sum( (pts_cor - pts_tilde).^2 , 1);
    
    res = nnz(res);
   
end