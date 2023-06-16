function img1 = read_as_grayscale(path_to_file)
aa=read_image(path_to_file);
img1=mean(aa, 3); 
imagesc(img1), colormap gray
end