function val = poteval(ptX,ptY,Geom,X)

% #############################################################################
% # Task 3d)
% #############################################################################

    [n,m] = size(ptX);
    val = zeros(n,m);

    for i = 1:n
        for j = 1:m
            x = [ptX(i,j), ptY(i,j)];
            for k = 1:length(X)
                y1 = Geom(k,:);
                y2 = Geom(k+1,:);
                val(i,j) = val(i,j) + quadgk(@(t) integrand(t, x, y1, y2), 0, 1) * X(k);
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

