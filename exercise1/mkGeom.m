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
  assert("This geometry is not yet implemented!")
% Will construct an l-shape domain
elseif( c == 'l')
  % #########################################################################
  % # Task 1b)
  % #########################################################################
  assert("This geometry is not yet implemented!")
% construction of the Bezier curve
elseif( c == 'b')
	% ###########################################################################
	% # Task 1d)
	% ###########################################################################
	% use nrbeval from the nurbs package (https://octave.sourceforge.io/nurbs/)
	crv = getBezierCurve();
	assert("This geometry is not yet implemented!")
else
	% example for the return of the function
	geom = [0, 0;
					1, 0;
					1, 1;
					0, 1;
					0, 0];
end

