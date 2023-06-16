function warped = warp_16x16(source)
    warped = zeros (16,16);
    for i = 1 :16
        for j = 1: 16
            coords_target = [i ; j];
            coords_source = transform_coordinates (coords_target);
            coords_source_flip = flip(coords_source);
            warped (j , i) = sample_image_at(source, coords_source_flip);
        end
    end
end