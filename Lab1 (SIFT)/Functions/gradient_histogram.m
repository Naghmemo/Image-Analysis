function [histogram] = gradient_histogram(grad_x, grad_y)

    histogram=zeros(8,1); %since we are using 8 bin histogram
    magnitude=sqrt((grad_x.^2)+(grad_y.^2)); % calculation of the magnitute of gradients
    angle_vector=atan2(grad_y, grad_x); % calculation of the angle of gradients
    % we are using 8 bin histogram, ranging from -180 to 180. 
    % divided by the number of bins which results in pi/4

    for i=1:length(histogram)/2
    angle_1 = find(angle_vector >= (i-1)*(pi/4) & angle_vector < i*(pi/4));
    histogram(8-i+1) = sum(magnitude(angle_1));
    
    angle_2 = find(angle_vector >= -i*(pi/4) & angle_vector < (1-i)*(pi/4));
    histogram(i) = sum(magnitude(angle_2));
        
    end

end



%         if angle_vecor(i)>(-pi/4) && angle_vecor(i)<=(0)
%             histogram(1)= histogram(1)+magnitude;
%         elseif angle_vecor(i)>(-pi/2) && angle_vecor(i)<=(-pi/4)
%             histogram(2)= histogram(2)+magnitude;
%         elseif angle_vecor(i)>(-3*pi/4) && angle_vecor(i)<=(-pi/2)
%             histogram(3)= histogram(3)+magnitude;
%         elseif angle_vecor(i)>(-pi) && angle_vecor(i)<=(-3*pi/4)
%             histogram(4)= histogram(4)+magnitude;
%         elseif angle_vecor(i)>(3*pi/4) && angle_vecor(i)<=(pi)
%             histogram(5)= histogram(5)+magnitude;
%         elseif angle_vecor(i)>(pi/2) && angle_vecor(i)<=(3*pi/4)
%              histogram(6)= histogram(6)+magnitude;
%         elseif angle_vecor(i)>(pi/4) && angle_vecor(i)<=(pi/2)
%             histogram(7)= histogram(7)+magnitude;
%         elseif angle_vecor(i)>(0) && angle_vecor(i)<=(pi/4)
%             histogram(8)= histogram(8)+magnitude;