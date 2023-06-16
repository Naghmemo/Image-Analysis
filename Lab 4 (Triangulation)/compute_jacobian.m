function jacobian = compute_jacobian(Ps, U)

    jacobian=zeros(2*length(Ps),3);
   
    Us = [U;1];
    
    for i=1:length(Ps)
        
        P = Ps{i};
        a = P(1,:); 
        b = P(2,:);
        c = P(3,:);
        jacobian((i - 1) * 2 + 1, :) = (a(1:3) * (c * Us) - (a * Us) * c(1:3)) / ((c * Us).^2);
        jacobian((i - 1) * 2 + 2, :) = (b(1:3) * (c * Us) - (b * Us) * c(1:3)) / ((c * Us).^2);
    
    end


end