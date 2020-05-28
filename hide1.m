
cover = imread('1.jpg');
 message = imread('3.jpg');

 %OTSU
F=graythresh(cover);
BW=im2bw(cover,F);

%cover1=rgb2gray(cover);
%S=MeanShiftFilter(cover1,3,3);
%BW1= imbinarize(cover);
%BW1=bwareaopen(BW,50);
%cc=bwconncomp(BW1);

 figure(1), imshow(cover); title('Original Image (Cover Image)');
 figure(2), imshow(message);title('Image to Hide (Message Image)');
 %figure(8), imshow(F);title('Otsu');
 
 cover=double(cover);
 message=double(message);

 imbed=4;

 messageshift=bitshift(message,-(8-imbed));

 showmess=uint8(messageshift);
 showmess=bitshift(showmess,8-imbed);
 figure(3),imshow(showmess);title('4 Bit Image to Hide');

 coverzero = cover;

 for i=1:imbed
 coverzero=bitset(coverzero,i,0);
 end

 stego = uint8(coverzero+messageshift);
 figure(4),imshow(stego);title('Stego image');
 
 imwrite(showmess,'showmesscolor.bmp');
 imwrite(stego,'stegocolor.bmp');
 
 originalcover= rgb2gray(cover);
 outputimage=rgb2gray(stego);
 messageimage=rgb2gray(message);
 
  figure(5),imhist(originalcover);title('Histogram of Cover');
  figure(6),imhist(messageimage);title('Histogram of message Image to be hidden');
  figure(7),imhist(outputimage);title('Histogram of the Stego Image');
 
  figure(8), imshow(BW);title('Otsu');
  %figure(9), imshow(cc);title('Otsu -  connected');
  %figure(9), imshow(S);title('Otsu');
   
   