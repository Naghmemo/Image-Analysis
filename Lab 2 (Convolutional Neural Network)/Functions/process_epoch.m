function [w, w0] = process_epoch(w, w0, lrate, examples_train, labels_train,sequential)
    % just used for the sequential part
    if nargin>5 && sequential
        epoch_example=examples_train;
        epoch_label=labels_train;
    else
        % applied for normal cases that we shuffle training examples
        index_rand=randperm(size(examples_train,2)); % creating a random number for choosing the train example
        epoch_example=examples_train(index_rand);
        epoch_label=labels_train(index_rand);
    end
    for i=1:size(examples_train,2)
        % calculating the partial gradient for each epoch example
        [wgrad, w0grad] = partial_gradient(w, w0, epoch_example{i}, epoch_label(i));
        % updating the w and w0 for each epoch
        w=w-(lrate*wgrad);
        w0=w0-(lrate*w0grad);
    end
end
