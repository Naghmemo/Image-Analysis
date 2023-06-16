function [X_train_norm,X_test_norm] = normalize_data(Xtrain,Xtest)

    % Calculate mean for each color channel using training data
    mean_train = mean(Xtrain, 'all');

    % Calculate std for each color channel using training data
    std_train = std(Xtrain,1,'all');

    % Normalize training and test data using calculated 
    % mean and standard deviation from training data
    X_train_norm = (Xtrain - mean_train) ./ std_train;
    X_test_norm = (Xtest - mean_train) ./ std_train;

end