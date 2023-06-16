similar_num=0;
position=[20; 20];
radius=6;
% perform the classify digit function for all digits then estimate
% precision based on the detected digits
for i=1:length(digits_validation)
    label = classify_digit(digits_validation(i).image, digits_training,position,radius);
    if label ==digits_validation(i).label
        similar_num=similar_num+1;
    end
end
Precision=similar_num/length(digits_validation)*100;
disp(['Precision is ' num2str(Precision) ' %'])

