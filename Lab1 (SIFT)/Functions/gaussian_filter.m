function [Gaussian_Filtered] = gaussian_filter(image,stand_dev)


    %filter size should be at least 4 times stand_dev, we consider it to be 5 times 
    A=ceil(5*stand_dev);
    
    gau_filt=fspecial("gaussian",A,stand_dev);
    Gaussian_Filtered=imfilter(image,gau_filt,'symmetric');

end