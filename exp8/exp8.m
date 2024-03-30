% Given matrix 'a'
a = [
    0 0 0 0 0 0 0;
    1 1 0 0 1 1 0;
    1 1 0 0 1 1 0;
    1 1 1 1 1 1 0;
    1 1 1 1 1 1 0;
    1 1 0 0 1 1 0;
    1 1 0 0 1 1 0;
    0 0 0 0 0 0 0
];

% Given structuring element 'st'
st = [
    1 1;
    0 0
];

% Define the size of the structuring element
[st_rows, st_cols] = size(st);

% Initialize the result matrices
eroded_image = zeros(size(a));
dilated_image = zeros(size(a));
opened_image = zeros(size(a));
closed_image = zeros(size(a));

% Perform erosion operation
for i = 1:size(a, 1) - st_rows + 1
    for j = 1:size(a, 2) - st_cols + 1
        if all(all(a(i:i+st_rows-1, j:j+st_cols-1) == st))
            eroded_image(i+1, j+1) = 1;
        end
    end
end

% Perform dilation operation
for i = 1:size(a, 1) - st_rows + 1
    for j = 1:size(a, 2) - st_cols + 1
        if any(any(a(i:i+st_rows-1, j:j+st_cols-1) == st))
            dilated_image(i+1, j+1) = 1;
        end
    end
end

% Perform opening operation (erosion followed by dilation)
opened_image = dilated_image;
for i = 1:size(a, 1) - st_rows + 1
    for j = 1:size(a, 2) - st_cols + 1
        if all(all(eroded_image(i:i+st_rows-1, j:j+st_cols-1) == st))
            opened_image(i+1, j+1) = 1;
        end
    end
end

% Perform closing operation (dilation followed by erosion)
closed_image = eroded_image;
for i = 1:size(a, 1) - st_rows + 1
    for j = 1:size(a, 2) - st_cols + 1
        if any(any(dilated_image(i:i+st_rows-1, j:j+st_cols-1) == st))
            closed_image(i+1, j+1) = 1;
        end
    end
end

% Display results
subplot(2, 2, 1); imshow(eroded_image); title('Eroded Image');
subplot(2, 2, 2); imshow(dilated_image); title('Dilated Image');
subplot(2, 2, 3); imshow(opened_image); title('Opened Image');
subplot(2, 2, 4); imshow(closed_image); title('Closed Image');
