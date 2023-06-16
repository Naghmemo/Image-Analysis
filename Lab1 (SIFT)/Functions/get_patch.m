function [patch] = get_patch(image, x, y, patch_radius)

    %calculates the start and end points for the patch
    x_start=x-patch_radius;
    x_end=x+patch_radius;
    y_start=y-patch_radius;
    y_end=y+patch_radius;
    
    %calculates the dimension of the image
    x_num=size(image,2);
    y_num=size(image,1);
    
     %checks if the patch is outside of the image
        if x_start<1
            error("'Patch outside image border'")
        elseif y_start<1
            error("'Patch outside image border'")
        elseif x_end>x_num
            error("'Patch outside image border'")
        elseif y_end>y_num
            error("'Patch outside image border'")
        end
    
    patch=image(y_start:y_end,x_start:x_end,:);

end





