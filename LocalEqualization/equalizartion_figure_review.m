%local equalization
figure_tif = '5050_cropped_W1_sb200um_editb.tif';

%gfap
fig = imread(figure_tif);
fig_red = fig(:,:,1);
fig_red = im2double(fig_red);
z=colfilt(fig_red,[6 6],'sliding',@std);
M=mean2(fig_red);
m=colfilt(fig_red,[6 6],'sliding',@mean);
k = 1;
A=k*M./z;
g=A.*(fig_red-m)+m;
imshow(fig_red), figure, imshow(g);

green = zeros(1542,1542);
ColorImageA = cat(3,g,green,g);

figure;
imshow(ColorImageA)


%gfap
fig = imread(figure_tif);
fig_green = fig(:,:,2);
fig_green = im2double(fig_green);
z=colfilt(fig_green,[6 6],'sliding',@std);
M=mean2(fig_green);
m=colfilt(fig_green,[6 6],'sliding',@mean);
k = 1;
A=k*M./z;
g=A.*(fig_green-m)+m;
imshow(fig_green), figure, imshow(g);

ColorImageB = cat(3,green,g,green);

figure;
imshow(ColorImageB)

C = imfuse(ColorImageB, ColorImageA);
figure;
imshow(C)