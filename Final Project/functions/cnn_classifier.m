function layers = cnn_classifier()
    layers = [
    imageInputLayer([32 32 3]);    

    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer

    maxPooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,64,'Padding','same')
    batchNormalizationLayer
    reluLayer

    maxPooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,128,'Padding','same')
    batchNormalizationLayer
    reluLayer

    fullyConnectedLayer(128)
    reluLayer

    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];   

end