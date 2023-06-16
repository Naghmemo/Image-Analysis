function value = sample_image_at(img, position) 

    % giving the nearest decimal to position
    x = round(position(2));
    y = round(position(1));
    
    % condition for considering the right value for position
    if (x <= 0) || (x > size(img, 2))
        value = 1;
    elseif (y <= 0) || (y > size(img, 1))
        value = 1;
    else
        value = img(y, x);
    end

end