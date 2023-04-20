clear all;
close all;
% pkg load nurbs;

% #############################################################################
% # Task 1
% #############################################################################
% Number of points for the polygon
num = 12;
% The opptions are 'c', 'l' and 'b'
geometry = 'b';
% Make geometry approximation
points = mkGeom(num, geometry);

% Plotting
figure(1)
plot(points(:,1), points(:,2), "-o", 'linewidth', 2)
% scatter(points(:,1), points(:,2))
hold on
axis('square')

% #############################################################################
% # Task 2
% #############################################################################

colpts = (points(1:end-1,:) + points(2:end,:)) / 2;
rhs = data(colpts(:,1), colpts(:,2));
plot(colpts(:,1), colpts(:,2), 'x')

plotRHS(geometry, points, colpts, rhs);