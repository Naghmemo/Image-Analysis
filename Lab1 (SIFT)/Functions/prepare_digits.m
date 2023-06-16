
position=[20; 20];
radius=6;
for i=1:length(digits_training)
    image=digits_training(i).image;
    desc = gradient_descriptor(image, position, radius);
    digits_training(i).descriptor=desc;
end