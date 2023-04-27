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
            yj = Geom(j,2);
            yj2 = Geom(j+1,2);
            sysmat(i,j) = quadgk(@(y) fundamentalsol(xi,y), yj, yj2); % fixme: Change integration path
        end
    end

end