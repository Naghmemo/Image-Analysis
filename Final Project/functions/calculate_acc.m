function accuracy = calculate_acc(Y_pred,Y_test)

    % Calculate the number of correct predictions by comparing the
    % network's predicted labels with the correct labels of the test set.
    corr_pred = nnz(Y_pred == Y_test);

    accuracy = (corr_pred / length(Y_test))*100;

end