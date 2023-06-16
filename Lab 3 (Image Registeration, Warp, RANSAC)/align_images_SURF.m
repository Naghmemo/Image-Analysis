function warped = align_images_SURF(source, target, threshold, upright)

    % extract SIFT features for source image
     points_source = detectSURFFeatures(source);
     [features_source, pts_source] = extractFeatures(source,points_source, 'Upright',upright);
    
    % extract SIFT features for target image
    points_target = detectSURFFeatures(target);
    [features_target, pts_target] = extractFeatures(target,points_target, 'Upright',upright);
    

    % match features
    corrs = matchFeatures(features_source, features_target, 'MaxRatio', 0.7, 'MatchThreshold', 100);

    pts_source_corr = pts_source(corrs(:, 1),:);
    pts_target_corr = pts_target(corrs(:, 2),:);
    
    
    %[A, t] = ransac_fit_affine((pts_source_corr.Location), (pts_target_corr.Location), threshold);

    [A, t] = ransac_fit_affine(transpose(pts_source_corr.Location), transpose(pts_target_corr.Location), threshold);
    
    warped = affine_warp(size(target), source, A, t);


end