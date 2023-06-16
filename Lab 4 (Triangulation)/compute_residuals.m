function all_residuals = compute_residuals(Ps, us, U)

    all_residuals = zeros (2 * length(Ps), 1);

    for i = 1 : length(Ps)

        Lu = Ps{i} * [U ; 1];

        if Lu (3) > 0
            all_residuals((i - 1)* 2 + 1) = (Lu(1)/Lu(3)) - us(1,i);
            all_residuals((i - 1)* 2 + 2) = (Lu(2)/Lu(3)) - us(2,i);
        else
            all_residuals((i - 1)* 2 + 1) = inf;
            all_residuals((i - 1)* 2 + 2) = inf;
        end
        
    end

end