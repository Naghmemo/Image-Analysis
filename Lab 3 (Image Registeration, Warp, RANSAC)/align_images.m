function warped = align_images(source, target, thresh) 

    % extract SIFT features for source image
    points_source = detectSIFTFeatures(source);
    [features_source, pts_source] = extractFeatures(source,points_source);
    
    % extract SIFT features for target image
    points_target = detectSIFTFeatures(target);
    [features_target, pts_target] = extractFeatures(target,points_target);

    %  match features
    corrs = matchFeatures(features_source, features_target, 'MaxRatio', 0.8, 'MatchThreshold', 100);

    pts_source_corr = pts_source(corrs(:, 1),:);
    pts_target_corr = pts_target(corrs(:, 2),:);
   

    [A, t] = ransac_fit_affine(transpose(pts_source_corr.Location), transpose(pts_target_corr.Location), thresh);

    warped = affine_warp(size(target), source, A, t);

end