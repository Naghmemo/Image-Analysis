function positive = check_depths(Ps, U)
    %we need the depth of the image, which is lambda
    positive = zeros (size(Ps,1));

    for i = 1 : length(Ps)
        
        Lu = Ps{i} * [U ; 1];

        if Lu(3) >= 0
            positive(i) = true;
        else
            positive(i) = false;
        end
    end

end