function U = refine_triangulation(Ps, us, Uhat)

    U = Uhat;

    for n = 1:5
        residuals = compute_residuals(Ps, us, U);    % residuals vector 
        Jacobian = compute_jacobian(Ps, U);    % Jacobian matrix
        U = U - ((Jacobian' * Jacobian) \ Jacobian') * residuals;     % update triangulated points
    end

end