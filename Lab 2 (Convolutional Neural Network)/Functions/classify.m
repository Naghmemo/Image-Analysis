function predicted_labels = classify(examples_val,w,w0)
    % define an array for predicted labels
    predicted_labels = zeros(1, length(examples_val));
    % checking the validations examples to predict the labels
    for i=1:length(examples_val)
        if sum ( dot ( examples_val{i} , w ) ) > w0
            predicted_labels(i) = 1;
        else
            predicted_labels(i) = 0;
        end
    end
end