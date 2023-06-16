function [X_train,Y_train, X_val, Y_val] = train_val_split(X , Y)

    % Split the data into train and validation sets with a ratio of 80/20.
    c = cvpartition(length(Y),'Holdout',0.2); 
    
    % Indexes of the training set
    index_train = training(c);
    X_train = X(:,:,:,index_train);
    Y_train =Y(index_train);
    
    % Indexes of the validation set
    index_val = test(c);
    X_val = X(:,:,:,index_val);
    Y_val = Y(index_val);

end