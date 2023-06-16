function [grad_x, grad_y] = gaussian_gradients(img, std)

img_1=gaussian_filter(img,std); %firstly, the image should be filtered by our gaussian_filter

h=[-1/2 0 1/2]; % this is the definition of local derivatives filter

grad_x=imfilter(img_1,h,'symmetric'); % caclculation of gradients for x-direction

grad_y=imfilter(img_1,h.','symmetric');% caclculation of gradients for y-direction

end