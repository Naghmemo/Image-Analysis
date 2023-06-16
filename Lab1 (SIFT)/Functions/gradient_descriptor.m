function [desc] = gradient_descriptor(image, position, radius)
    std=0.2*radius;  %standard deviation proportional to radius,
    % we reach to 0.2 by trial and error
     
    region_centres = place_regions(position, radius);
    desc=[];
    dn = 1;
    
    for c=1:length(region_centres)
        % getting the patch with respect to the given centre and the radius
        patch = get_patch(image, region_centres(1,c), region_centres(2,c), radius);
        % calculate the gaussian grandient for the patch
        [grad_x, grad_y] = gaussian_gradients(patch, std);
        % calculate the gradient histogram
        desc(dn:dn+7)=gradient_histogram(grad_x, grad_y);
        dn = dn + 8;
    end
    % normalizing the vector to unit length
    desc=desc / norm(desc);
end