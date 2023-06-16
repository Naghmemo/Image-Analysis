load sequence.mat

thr = 5;
n = ceil(length(triangulation_examples)* 0.7);
Us = [];
for i = 1 : n

    Ps = triangulation_examples(i).Ps;
    us = triangulation_examples(i).xs;
    [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold);

    if nbr_inliers >= 2
        Us = [Us U];
    end
end



