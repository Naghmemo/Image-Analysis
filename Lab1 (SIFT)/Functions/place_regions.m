function region_centres =  place_regions(centre, radius)
    % Given centre
    x1=centre(2);
    y1=centre(1);
    % define an empty array for centre of all 9 regions
    region_centres=zeros(2,9);
    % calculation of every region's centre with respect to the radius and
    % given centre
    for i=-1:1
        for j=-1:1
            y=y1+2*j*radius;
            x=x1+2*i*radius;
            region_centres(:,-3*i+j+5)=[y;x];
        end
    end
end