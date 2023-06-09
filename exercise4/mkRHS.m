function rhs = mkRHS(Geom,method)

if(method == 'c')

	% Takes the Geometry and intializes a right hand side given from data()
	n = length(Geom)-1;
	rhs = zeros(1,n);

	for i = 1:n
	% (x,y) is the midpoint of the geometry segment, i.e. the collocation point.
	   x = .5*(Geom(i,1)+Geom(i+1,1));
	   y = .5*(Geom(i,2)+Geom(i+1,2));
	   rhs(i) = data(x,y);
	end
elseif(method == 'g')

	% Takes the Geometry and intializes a right hand side given from data()
	n = length(Geom)-1;
	rhs = zeros(1,n);
	% #############################################################################
	% # Task 4c)
	% #############################################################################

	for i = 1:n
        p1 = Geom(i,:);
        p2 = Geom(i+1,:);
        px = @(t) p1(1)*t + p2(1)*(1-t); % parametrization of p1 -> p2
        py = @(t) p1(2)*t + p2(2)*(1-t); % parametrization of p1 -> p2
        rhs(i) = quadgk(@(t) data(px(t), py(t)) * norm(p2 - p1), 0, 1);
    end

end

end

