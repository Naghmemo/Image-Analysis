function net = train_classifier(layers, imgs_train, labels_train, imgs_val, labels_val)
    % define tranining options using stochastic gradient decent method
    options = trainingOptions('sgdm', 'MaxEpochs', 15, 'Verbose', 0);
    % use this function that trains dataset with desired options and layers
    net = trainNetwork(imgs_train, labels_train, layers, options);
    % finding the correct classified examples
    number_none_zero = nnz(net.classify(imgs_val) == labels_val); 
    % clalulating the accuracy of the CNN 
    accuracy_CNN = (number_none_zero / length(labels_val))*100;
    disp(['CNN Accuracy: ' num2str(accuracy_CNN) '%%'])
end