
clc
close all    
clear all   
%% parameters
cluster=3; % the number of clustering centers
se=3; % the parameter of structuing element used for morphological reconstruction
w_size=3; % the size of fitlering window
%% test a color image
fileID='12003';
f_ori=imread('starfish.jpg');
subplot(1,2,1);
imshow(f_ori);title('Original Image');
GT=load('12003.mat'); % Ground Truth, download from 'https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html'
f_ori=double(f_ori);
%% implement the proposed algorithm
tic 
[~,U1,~,~]=FRFCM_c(double(f_ori),cluster,se,w_size);
Time1=toc;
disp(strcat('running time is: ',num2str(Time1)))
f_ori;
f_seg=fcm_image_color(f_ori,U1);
subplot(1,2,2);
f_seg = rgb2gray(f_seg);
imshow(f_seg);title('segmentated result');
