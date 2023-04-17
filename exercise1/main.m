clear all;
close all;
pkg load nurbs;

% #############################################################################
% # Task 1
% #############################################################################
% Number of points for the polygon
num = 12;
% The opptions are 'c', 'l' and 'b'
geometry = 's';
% Make geometry approximation
points = mkGeom(num, geometry);

% Plotting
figure 1
plot(points(:,1), points(:,2), 'linewidth', 2)
hold on
axis('square')

% #############################################################################
% # Task 2
% #############################################################################

% colpts = 
% rhs = 
% plot(colpts(:,1), colpts(:,2), 'x')

% plotRHS(geometry, points, colpts, rhs);