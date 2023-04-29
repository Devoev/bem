function sysmat = mkMat(Geom)
%
%	Assembles the Matrix. Gets the geometry as input and uses piecewise constant functions.
%
% #############################################################################
% # Task 3c)
% #############################################################################

    [n,d] = size(Geom);
    n = n-1;
    sysmat = zeros(n,n);

    for i = 1:n
        for j = 1:n
            xi = Geom(i,1);
            y1 = Geom(j,2);
            y2 = Geom(j+1,2);
            %sysmat(i,j) = quadgk(@(y) fundamentalsol(xi,y), yj, yj2); % fixme: Change integration path
            u0 = xi - y1;
            u1 = xi - y2;
            sysmat(i,j) = (u1*(log(abs(u1)) - 1) - u0*(log(abs(u0)) - 1)) / (-2*pi);
        end
    end

end