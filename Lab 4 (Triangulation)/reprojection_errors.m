function errors = reprojection_errors(Ps, us, U)

    us_2 = zeros (2 , size(Ps,1));

    for i = 1 : size (Ps , 2)

        Lu = Ps{i} * [U ; 1];

        if Lu(3) < 0

            us_2 (:,i) = inf;

        else

            us_2 (:,i) = Lu (1:2) / Lu(3);

        end
    end

    errors = sqrt(sum((us_2-us).^2));
    
end