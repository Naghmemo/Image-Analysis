function E = essentialMatrix(P1,P2)
% E = [t]x R
% [t]x: [t]x is the matrix representation of the cross product with t
% R: rotation between P1 and P2

    % 1st Camera
    R1 = P1(:, 1:3);
    t1 = P1(:,4);

    t_1 = [ 0 ,  - t1(3) , t1(2);
          t1(3),     0    , -t1(1);
         -t1(2),   t1(1)  ,   0];
    E1 = t_1*R1;
    
    % 2nd Camera
    R2 = P2(:, 1:3);
    t2 = P2(:,4);

    t_2 = [ 0 ,  - t2(3) , t2(2);
          t2(3),     0    , -t2(1);
         -t2(2),   t2(1)  ,   0];

    E2 = t_2*R2;

    E = [E1 E2];
    

end