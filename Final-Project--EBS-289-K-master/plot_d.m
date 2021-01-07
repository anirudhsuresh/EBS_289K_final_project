% % /***************************************************************************************
% % *    Title:  Plot directed
% % *    Author: Domenico Teodonio (2020)
% % *    Code version: Updated 31 May 2015
% % *    Availability:(https://www.mathworks.com/matlabcentral/fileexchange/51015-plot-directed), MATLAB Central File Exchange. Retrieved June 11, 2020.
% % /***************************************************************************************

function plot_d(X,Y,LineSpec,angle,length_line)
% This function plots a 2-D line with the direction of the path.
% plot_d(X,Y,LineSpec,angle)
% - X and Y must be of the same length
% - angle determines the degrees of angulation of the arrow
% - length_line must be positive and determines the lenght of the arrow's end
% Example:
% X=linspace(0,2*pi);
% Y=sin(X);
% plot_d(X,Y,'-b',45,0.3);
    
% defines the midpoint and the direction angle
middle=fix(length(X)/2);
Xmidpoint=X(middle);
Ymidpoint=Y(middle);
direction_angle=atan((Y(middle+1)-Ymidpoint)/(X(middle+1)-Xmidpoint));
if (Y(middle+1)-Ymidpoint)>0 && (X(middle+1)-Xmidpoint)<0
    direction_angle=direction_angle+pi;
end
if (Y(middle+1)-Ymidpoint)<0 && (X(middle+1)-Xmidpoint)<0
    direction_angle=direction_angle+pi;
end
if direction_angle<0
    direction_angle=direction_angle+2*pi;
end

% defines the lines of the arrow
Xdx_arrow=Xmidpoint-(cos(direction_angle+(2*pi/360)*angle))*length_line;
Ydx_arrow=Ymidpoint-(sin(direction_angle+(2*pi/360)*angle))*length_line;
Xsx_arrow=Xmidpoint-(cos(direction_angle-(2*pi/360)*angle))*length_line;
Ysx_arrow=Ymidpoint-(sin(direction_angle-(2*pi/360)*angle))*length_line;

% plots the function and the arrows
figure(2);
hold on
plot(X,Y,LineSpec);
hold on;
plot(linspace(Xmidpoint,Xdx_arrow,10),linspace(Ymidpoint,Ydx_arrow,10),LineSpec);
plot(linspace(Xmidpoint,Xsx_arrow,10),linspace(Ymidpoint,Ysx_arrow,10),LineSpec);
% hold off;

%puts the axis at the same scale
axis equal;