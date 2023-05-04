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
            xi = Geom(i,:);
            yj1 = Geom(j,:);
            yj2 = Geom(j+1,:);
            if i ~= j
                yt = @(t) yj1*t + yj2*(1-t); % parametrization of gamma_y
                sysmat(i,j) = quadgk(@(t) arrayfun(@(ti) fundamentalsol(xi, yt(ti)), t) * norm(yj2 - yj1), 0, 1);
            else
                a = norm(yj1 - yj2);
                sysmat(i,j) = -a * (log(a/2) - 1) / (2*pi);
            end
        end
    end

end