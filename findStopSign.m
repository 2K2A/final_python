function has_stop_sign = findStopSign(image)
filtered_image = redFilter(image);
test_image = imfill(filtered_image,'holes');
figure;
Ca = corner(test_image,'QualityLevel',.2);

imshow(image)

hold on

scatter(Ca(:,1),Ca(:,2),80,'filled','k');
hold off

% Commented out section is using a hough transform
% The corners seem to be a good start though

% edge_image = edge(filtered_image,'canny');
% [H,T,R] = hough(edge_image,'RhoResolution',0.5,'Theta',-90:0.5:89);
% P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
% lines = houghlines(filtered_image,T,R,P,'FillGap',5,'MinLength',7);
% 
% figure, imshow(filtered_image), hold on
% max_len = 0;
% for k = 1:length(lines)
%    xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%    % Plot beginnings and ends of lines
%    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% end