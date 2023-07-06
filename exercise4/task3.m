clear all;
close all;

N = 10;
method = 'g';

% Assembly
[p1,p2] = mkGeom(N);
geom = [p1;p2];

A11 = mkMat(p1, method);
A22 = mkMat(p2, method);
b1 = mkRHS(p1,method);
b2 = mkRHS(p2,method);

% Solver
A = blkdiag(A11, A22); % TODO: A21 and A12
b = [b1,b2];
x = A\b'

%% Post processing
%err = [];
%[ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err] = repformeval(err,'s',geom,x);
%
%disp(err)
%
%visualize(Geom,geometry,ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err);