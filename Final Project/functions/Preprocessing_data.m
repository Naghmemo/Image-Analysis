function [X_train_p , X_test_p] = Preprocessing_data(train_data , test_data)

    % reshaping vectors of training and test datasets to matrix
    N =  size(train_data, 1);  % number of training images
    M =  size(test_data ,1);   % number of test images
    X_train_reshape = double(reshape (train_data , [N , 32 , 32 , 3]));
    X_test_reshape = double(reshape (test_data , [M , 32 , 32 , 3]));
    
    % permute the width and culumns, and the indice of images
    X_train_p = permute(X_train_reshape , [3 , 2 , 4 , 1]);
    X_test_p = permute(X_test_reshape , [3 , 2 , 4 , 1]);

end