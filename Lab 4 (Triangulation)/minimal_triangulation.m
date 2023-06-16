function U = minimal_triangulation(Ps, us)

    x1 = us(1,1);
    y1 = us(2,1);
    x2 = us(1,2);
    y2 = us(2,2);
    P1 = Ps{1};
    P2 = Ps{2};
    
    %based on lecture notes, we rearranged the camera equation to M(theta)=b

    b = [-P1(1,4);
         -P1(2,4);
         -P2(1,4);
         -P2(2,4);
         -P1(3,4)];

    M = [P1(1,1)  P1(1,2)  P1(1,3)  -x1  0;
         P1(2,1)  P1(2,2)  P1(2,3)  -y1  0;
         P2(1,1)  P2(1,2)  P2(1,3)   0 -x2;
         P2(2,1)  P2(2,2)  P2(2,3)   0 -y2;
         P1(3,1)  P1(3,2)  P1(3,3)  -1  0];

    theta = M \ b;
    
    U = theta (1:3);
end