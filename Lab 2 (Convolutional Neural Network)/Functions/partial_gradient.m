function    [wgrad, w0grad] = partial_gradient(w, w0, example_train, label_train)
% w :weight image, should be a 35*35*3
% w0:input weight, should be number
% example_train: an image in the training data
% label_train: the true label for the examples
% wgrad & w0grad:partial gradient of loss function with respect to w and w0

    C = example_train;  %to convert the cell to array
    I_w = sum(dot(C,w));
    y = I_w + w0;  %y=I.w+w0
    p=exp(y)/(1+exp(y)); % Calculation of probability using sigmoid function

    % Calculate the partial gradient of w and w0
    %L = -[label_train*ln(p) + (1-label_train)*ln(1-p)]
    if label_train==1
        wgrad = C * (p - 1);  % dL/dw = dL/dp * dp/dy * dy/dw
        w0grad = (p - 1); % dL/dw0 = p - 1
    else
        wgrad = C * p ;  % dL/dw = dL/dp * dp/dy * dy/dw
        w0grad = p ; % dL/dw0 = -p
    end
end
