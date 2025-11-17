clear; clc; close all;

imageFiles = {'studded_tire.jpeg', 'summer_tire.jpg'};

for i = 1:numel(imageFiles)

    % ---------- 1) Read & resize ----------
    I = imread(imageFiles{i});
    I = imresize(I, 0.5);   % optional scaling

    % ---------- 2) Convert to grayscale ----------
    if size(I,3) == 3
        Igray = rgb2gray(I);
    else
        Igray = I;
    end

    % ---------- 3) Create tire mask ----------
    THRESHOLD = 100;  % adjust based on your images
    tireMask = Igray < THRESHOLD;   % tire is darker than background
    tireMask = imfill(tireMask,'holes');  % fill holes
    tireMask = bwareaopen(tireMask, 500); % remove small objects

    % ---------- 4) Candidate studs ----------
    BRIGHT_THRESHOLD = 200;  % studs are bright points inside the tire
    cand = (Igray > BRIGHT_THRESHOLD) & tireMask;
    cand = bwareaopen(cand, 5); % remove small noise

    % Optional: smooth/blur
    cand = imclose(cand, strel('disk',1));

    % ---------- 5) Connected components ----------
    CC = bwconncomp(cand);
    stats = regionprops(CC, 'Area', 'Perimeter', 'Eccentricity');

    % ---------- 6) Filter candidates ----------
    studMask = false(size(cand));
    studCount = 0;

    % Parameters for filtering studs
    minA = 4;      % min area of a stud
    maxA = 120;    % max area of a stud
    minCirc = 0.6; % minimum circularity
    maxEcc = 0.85; % maximum eccentricity

    for k = 1:numel(stats)
        A = stats(k).Area;
        P = stats(k).Perimeter;
        E = stats(k).Eccentricity;

        if P == 0
            circ = 0;
        else
            circ = 4*pi*A/(P^2);
        end

        if (A >= minA) && (A <= maxA) && (circ >= minCirc) && (E <= maxEcc)
            studMask(CC.PixelIdxList{k}) = true;
            studCount = studCount + 1;
        end
    end

    % ---------- 7) Decision rule ----------
    isStudded = (studCount > 10);  % adjust threshold if needed

    % ---------- 8) Visualization ----------
    figure;
    subplot(1,3,1);
    imshow(I); title(sprintf('Input: %s', imageFiles{i}), 'Interpreter','none');

    subplot(1,3,2);
    imshow(cand); title('Candidate studs (binary)');

    subplot(1,3,3);
    imshow(I); hold on;
    visboundaries(studMask, 'Color','r', 'LineWidth', 0.7);

    if isStudded
        title(sprintf('STUDDED TIRE (studs: %d)', studCount));
    else
        title(sprintf('NON-STUDDED TIRE (studs: %d)', studCount));
    end

end
