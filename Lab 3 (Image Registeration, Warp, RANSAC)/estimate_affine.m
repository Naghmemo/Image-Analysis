function [A, t] = estimate_affine(pts, pts_tilde)
    % for affine transformation we have: A * [x , y] + [tx , ty] 
    % Since A is a matrix as: [ a b ; c d], for affine transformation we have:
    % [x , y] * A + [tx, ty] = [a * x + b * y + tx , c * x + d * y + ty]
    
    % for the pts 
    M = zeros( length(pts)*2 , 6);
    for i = 0 : length (pts) - 1
        x1 = pts (1 , i+1);
        y1 = pts (2 , i+1);
        M (i * 2 + 1,:) = [x1 , y1 , 1 , 0 , 0 , 0];
        M (i * 2 + 2,:) = [0 , 0 , 0 , x1 , y1, 1];
    end
    
    %for the pts_tilde
    V = zeros( length(pts_tilde) * 2 , 1);
    for j = 0 : length(pts_tilde) - 1
        V(j * 2 + 1) = pts_tilde (1 , j+1);
        V(j * 2 + 2) = pts_tilde (2 , j+1);
    end
    
    % estimate parameters.
    X = M \ V;
    
    A = [X(1), X(2);
         X(4), X(5)];
    
    t = [X(3); X(6)];
end