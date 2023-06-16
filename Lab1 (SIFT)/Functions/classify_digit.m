function label = classify_digit(digit_image, digits_training,position,radius)
    % calculates tha gaussian descriptor for given image with the desired
    % centre and radius
    desc1=gradient_descriptor(digit_image, position, radius);
    Best_index=1;
    Best_mse=inf;
    % within this loop we calculate the mean square error between the
    % calculated descriptor and the descriptor in our data
    for i=1:length(digits_training)
        mse=mean((desc1-digits_training(i).descriptor).^2);
        if mse<Best_mse
            Best_mse=mse;
            Best_index=i;
        end
    end
    label=digits_training(Best_index).label;
end