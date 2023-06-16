function label = classify_church(image, feature_collection)
    % here, detect SIFT points in the image 
    points = detectSIFTFeatures(image);
    % calculates the descriptor for calculated SIFT points
    [descs_2, validPoints] = extractFeatures(image,points);
    num_match=zeros(length(feature_collection.names),1);
    for i=1:length(feature_collection.names)
        descs_1=feature_collection.descriptors(:,feature_collection.labels==i);
        % match above calculated descriptors with the corresponding 
        % descriptor within the data using the Lowe criterion with threshold 0.7
        % ATTENTION: transposed first descriptor in order to have the same
        % number of colomns
        corrs = matchFeatures(descs_1', descs_2, 'MatchThreshold', 100, 'MaxRatio', 0.7);
        num_match(i)=size(corrs,1);
    end
    % return the best match that the algorithm vote for
    label = find(num_match == max(num_match));
end