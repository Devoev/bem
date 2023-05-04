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
                sysmat(i,j) = quadgk(@(t) integrand(t, xi, yj1, yj2), 0, 1);
            else
                a = norm(yj1 - yj2);
                sysmat(i,j) = -a * (log(a/2) - 1) / (2*pi);
            end
        end
    end

end

function y = integrand(t, xi, yj1, yj2)
    y = zeros(size(t));
    for i = 1:length(t)
        y(i) = fundamentalsol(xi, yj1*t(i) + yj2*(1-t(i))) * norm(yj2 - yj1);
    end
end