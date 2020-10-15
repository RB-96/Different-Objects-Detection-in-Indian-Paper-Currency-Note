clear all
close all
clc

i=imread('C:\Users\HP\Desktop\Image_segmentation\500.jpg');
figure('Name','Original 500 rupees image','NumberTitle','off');imshow(i);

% i1=imresize(i,[300,500]);
[m,n,~]=size(i);
I=i;
%I=im2double(i1);
gray=rgb2gray(I);
gray=adapthisteq(gray);
gray=imadjust(gray);
figure('Name','Gray scale image','NumberTitle','off');imshow(gray);
%gray=histeq(gray);

bw=ones(m,n);
level = multithresh(gray,2); 
for p=1:m
    for q=1:n
        if gray(p,q)>level(1)
             bw(p,q)=0;         
        end
    end
end
figure('Name','Object detected image','NumberTitle','off'),imshow(bw);

cc = bwconncomp(bw);
graindata = regionprops(cc,'all');

grain_areas = [graindata.Area];
grain_areas1 = sort(grain_areas(:));

[ii,jj]=size(grain_areas);

x=cc.NumObjects;

grain = false(size(bw));


for h=1:100
    % No. of objects to show
  for i=1:x
    if(grain_areas(i)==grain_areas1(jj-(h-1)))
      hold on
         grain(cc.PixelIdxList{i}) = true;
         rectangle('Position', graindata(i).BoundingBox,'EdgeColor','g');
         text(graindata(i).Centroid(1),graindata(i).Centroid(2),sprintf('%d', i),'EdgeColor','b','Color','r');
      
      hold off
    end
  end
end

figure('Name','Threasholed image','NumberTitle','off');imshow(grain);
%
%j = imcrop(grain);
L = bwlabel(bw);
s = regionprops(L, 'BoundingBox');

subimage91 = imcrop(bw, s(91).BoundingBox);%latent image
subimage998 = imcrop(bw, s(998).BoundingBox);%left bar
subimage1063 = imcrop(bw, s(1063).BoundingBox);%identification mark
%subimage1063 = imcomplement(subimage1063);
subimage419 = imcrop(bw, s(419).BoundingBox);%gandhi
subimage969 = imcrop(bw, s(969).BoundingBox);%ashok


subimage162 = imcrop(bw, s(162).BoundingBox);%500ser
subimage163 = imcrop(bw, s(163).BoundingBox);
subimage164 = imcrop(bw, s(164).BoundingBox);
subimage165 = imcrop(bw, s(165).BoundingBox);


subimage908 = imcrop(bw,s(908).BoundingBox);%500
subimage914 = imcrop(bw,s(914).BoundingBox);
subimage921 = imcrop(bw,s(921).BoundingBox);
subimage925 = imcrop(bw,s(925).BoundingBox);

subimage826 = imcrop(bw, s(826).BoundingBox);%serialno
subimage836 = imcrop(bw, s(836).BoundingBox);
subimage886 = imcrop(bw, s(886).BoundingBox);
subimage911 = imcrop(bw, s(911).BoundingBox);
subimage913 = imcrop(bw, s(913).BoundingBox);
subimage919 = imcrop(bw, s(919).BoundingBox);
subimage922 = imcrop(bw, s(922).BoundingBox);
subimage928 = imcrop(bw, s(928).BoundingBox);
subimage929 = imcrop(bw, s(929).BoundingBox);


subimage785 = imcrop(bw,s(785).BoundingBox);%security thread
subimage764 = imcrop(bw,s(764).BoundingBox);
subimage719 = imcrop(bw,s(719).BoundingBox);

BW = im2bw(i);
%figure, imshow(BW);

%[j, rect] = imcrop(BW);
%figure, imshow(j);

j = imcomplement(j);



figure('Name','Identifiication mark','NumberTitle','off');imshow(subimage998);% at right side
figure('Name','Identifiication mark','NumberTitle','off');imshow(subimage1063);
figure('Name','Gandhiji face','NumberTitle','off'); imshow(subimage419);%gandhi
figure('Name','Ashok stamva','NumberTitle','off'); imshow(subimage969);%ashok

figure('Name','Latent image','NumberTitle','off'); imshow(subimage91);%Latent image


%500
figure('Name','Rupees amount','NumberTitle','off');
subplot(1,4,1),imshow(subimage908),subplot(1,4,2),imshow(subimage914),subplot(1,4,3),imshow(subimage921),subplot(1,4,4),imshow(subimage925);

%500ser
figure('Name','Rupees amount','NumberTitle','off');
subplot(4,1,1),imshow(subimage162),subplot(4,1,2),imshow(subimage163),subplot(4,1,3),imshow(subimage164),subplot(4,1,4),imshow(subimage165);

%serialno

figure('Name','Serial  number','NumberTitle','off');
subplot(1,9,1),imshow(subimage826),subplot(1,9,2),imshow(subimage836),subplot(1,9,3),imshow(subimage886),subplot(1,9,4),imshow(subimage911),subplot(1,9,5),imshow(subimage913),subplot(1,9,6),imshow(subimage919),subplot(1,9,7),imshow(subimage922),subplot(1,9,8),imshow(subimage928),subplot(1,9,9),imshow(subimage929);
%imshow(j);

figure('Name','Security thread','NumberTitle','off');
subplot(3,1,1),imshow(subimage785),subplot(3,1,2),imshow(subimage764),subplot(3,1,3),imshow(subimage719);



