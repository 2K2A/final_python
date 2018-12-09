function hasStop = detectStop(img)
image(img);

figure;
imshow(((img(:,:,1)>155))&(img(:,:,2)<120)&(img(:,:,3)<120));
f1 = (((img(:,:,1)>155))&(img(:,:,2)<120)&(img(:,:,3)<120));
f2 = imfill(f1, 'holes');
totalPixelsOfOct = sum(sum(f2));
figure;
imshow(f2);
f3 = ((f2 == 0) | f1) == 0;
figure;
imshow(f3);
totalPixelsOfSTOP = sum(sum(f3));
hasStop = totalPixelsOfOct / totalPixelsOfSTOP;