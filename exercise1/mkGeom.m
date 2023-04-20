function geom = mkGeom(n, c)
% Makes a geometry consisting of n linear pieces. Remember diam < 1!
%
% INPUT:
% 
%   n		: Number of points for the polygon
% 
%   c		: String for the curve selection
% 
% OUTPUT:
%
%   geom	: Coordinates of the points [x-values, y-values]

% Will construct a circle geometry
geom = [];
if ( c == 'c')
  % #########################################################################
  % # Task 1a)
  % #########################################################################
    r = 1;
    phi = linspace(0, 2*pi, n);
    geom = r*[cos(phi); sin(phi)]';
% Will construct an l-shape domain
elseif( c == 'l')
  % #########################################################################
  % # Task 1b)
  % #########################################################################
    a = 0.2;
    m = fix((n-1)/8);
    geom = a*[0,0; 0,1; 0,2; 1,2; 1,1; 2,1; 2,0; 1,0; 0,0];
    for k = 1:m
        size_g = size(geom);
        old = geom;
        geom = zeros(size(geom(:,1))*2);
        for i = 1:(size_g(1)-1)
            geom(2*i-1,:) = old(i,:);
            geom(2*i,:) = (old(i,:) + old(i+1,:))/2;
        end
    end

% construction of the Bezier curve
elseif( c == 'b')
	% ###########################################################################
	% # Task 1d)
	% ###########################################################################
	% use nrbeval from the nurbs package (https://octave.sourceforge.io/nurbs/)
	crv = getBezierCurve();
	u = linspace(0, 1, n);
	p = nrbeval(crv, u);
	geom = p(1:2,:)';
else
	% example for the return of the function
	geom = [0, 0;
					1, 0;
					1, 1;
					0, 1;
					0, 0];
end

