function [examples_train_aug,labels_train_aug] = augment_data(examples_train,labels_train,M)
    examples_train_aug={};
    labels_train_aug=[];
    for i=1:size(examples_train,2)
            for j=1:M
                II = examples_train{i};
                % define a random angle to rotate the samples
                rand_angle = randi([1 180], 1, M);
                % rotate the samples with random angles, with cropping
                image_rotated=imrotate(II, rand_angle(j), 'bilinear', 'crop');
                aug_index = (i-1)*M + j;
                % extending the training dataset for better learning with
                % adding rotated samples
                examples_train_aug{aug_index} = image_rotated;
                labels_train_aug(aug_index) = labels_train(i);
            end
    end
end