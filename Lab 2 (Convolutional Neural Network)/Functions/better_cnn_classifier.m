function layers = better_cnn_classifier()
   layers = [
   imageInputLayer([28 28 1]);
   convolution2dLayer(3, 25); %convolutional layer with 25 filters that have a height and width of 3
   reluLayer();
   maxPooling2dLayer(2,'Stride', 2);
   convolution2dLayer(3, 30); %convolutional layer with 30 filters that have a height and width of 3
   
   % adding more ReLu, max pooling and also fully-connected layers
   reluLayer(); 
   maxPooling2dLayer(2,'Stride', 2)
   fullyConnectedLayer(100);
   reluLayer();
   fullyConnectedLayer(10);
   softmaxLayer();
   classificationLayer()];
end