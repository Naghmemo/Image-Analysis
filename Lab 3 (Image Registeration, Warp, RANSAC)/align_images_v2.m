function warped = align_images_v2(source, target, threshold, upright, SURF)

    if nargin < 5

        % extract SIFT features for source image
        points_source = detectSIFTFeatures(source);
        [features_source, pts_source] = extractFeatures(source,points_source, 'Upright',upright);
        
        % extract SIFT features for target image
        points_target = detectSIFTFeatures(target);
        [features_target, pts_target] = extractFeatures(target,points_target, 'Upright',upright);

    else

        % extract SURF features for source image
        points_source = detectSURFFeatures(source);
        [features_source, pts_source] = extractFeatures(source,points_source, 'Upright',upright);
        
        % extract SURF features for target image
        points_target = detectSURFFeatures(target);
        [features_target, pts_target] = extractFeatures(target,points_target, 'Upright',upright);
        
    end 

    % match features
    corrs = matchFeatures(features_source, features_target, 'MaxRatio', 0.3, 'MatchThreshold', 100);

    % Now we have x and y of the features in source and the target
    pts_source_corr = pts_source(corrs(:, 1),:);
    pts_target_corr = pts_target(corrs(:, 2),:);
   
    % Using ransac to estimate A and t for the points in source and target
    [A, t] = ransac_fit_affine(transpose(pts_source_corr.Location), transpose(pts_target_corr.Location), threshold);

    % Warp the source image using estimated A and t from ransac
    warped = affine_warp(size(target), source, A, t);


end