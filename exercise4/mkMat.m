function sysmat = mkMat(Geom,method)
%
%	Assembles the Matrix. Gets the geometry as input and uses piecewise constant functions.
%

if(method == 'c')

	n = length(Geom)-1; 
	sysmat = zeros(n);

	for i = 1:n
		for j = 1:n
			if(i == j)
				% Uses the analytical solution
				sysmat(i,j) = analytSolCol(Geom(i,:),Geom(j+1,:));
            else
                % Uses the adaptive quadrature of matlab, which can deal with singularities at the endpoints of the intervals
				sysmat(i,j) = quadratureCol(Geom(j,:),Geom(j+1,:),.5*(Geom(i,:)+Geom(i+1,:)));
			end
		end
	end
else
	n = length(Geom)-1; 
	sysmat = zeros(n);
	% #############################################################################
	% # Task 4d)
	% #############################################################################

	for i = 1:n
    		for j = 1:n
    			if(i == j)
    				% Uses the analytical solution
    			    x0 = Geom(i,:);
                    x1 = Geom(i+1,:);
    			    m = norm(x0 - x1);
    				sysmat(i,j) = (m^2*(3 - 2*log(m)))/(4*pi);
                else
                    x0 = Geom(j,:);
                    x1 = Geom(j+1,:);
                    y0 = Geom(i,:);
                    y1 = Geom(i+1,:);
                    x = @(t) x0*t + x1*(1-t);
                    y = @(s) y0*s + y1*(1-s);
    				sysmat(i,j) = integral2(@(t,s) integralKernel(t, s, x, y) * norm(x1 - x0) * norm(y1 - y0), 0, 1, 0, 1);
    			end
    		end
    	end
end

end


% Analytical solution for the collocation singular case
function val = analytSolCol(p1,p2)
    l = norm(p2-p1);
	val = -(1./(2*pi))*l*(log(l/2)-1);
	val1 = -l /(2*pi) * (log(l) - 4);
end

% Quadrature of the kernel wrt the collocation point colloc
function val = quadratureCol(p1,p2,colloc)
    l =   norm(p1-p2); % length of the element
    fun = @(x) fundamentalsol(x*p1+(1-x)*p2,colloc);
%    val = l*quadgk(fun,0,1); % for octave, evaluation of the single layer integral
     val = l*integral(fun,0,1,'ArrayValued',1); % for matlab, evaluation of the single layer integral
end

function val = integralKernel(t, s, x, y)
    [n,m] = size(t);
    val = zeros(n,m);
    for i = 1:n
        for j = 1:m
            xij = x(t(i,j));
            yij = y(s(i,j));
            val(i,j) = fundamentalsol(xij, yij);
        end
    end
end
