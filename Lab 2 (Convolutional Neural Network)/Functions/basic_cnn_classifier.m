function  layers = basic_cnn_classifier()
   layers = [
   imageInputLayer([28 28 1]);
   convolution2dLayer(3, 25); %convolutional layer with 25 filters that have a height and width of 3
   reluLayer(); % applying the ReLu layer
   maxPooling2dLayer(2,'Stride', 2); % applying the max-pooling
   fullyConnectedLayer(10); 
   softmaxLayer();
   classificationLayer()];
end