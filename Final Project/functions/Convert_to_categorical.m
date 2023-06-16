function [Y_train, Y_test] = Convert_to_categorical(Ytrain, Ytest, Lables)

    Lable_numbers = {'0' ; '1' ; '2' ; '3' ; '4' ; '5' ; '6' ; '7' ; '8' ; '9'};
    
    % Converting Ytrain to categorical data
    Y_train_cat = categorical (Ytrain);
    Y_test_cat = categorical (Ytest );
    
    
    % set the categorical values to Lables_names
    Y_train = renamecats(Y_train_cat , Lable_numbers , Lables); 
    Y_test = renamecats(Y_test_cat , Lable_numbers ,  Lables);

end