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
                yt = @(t) y1*t + y2*(1-t); % parametrization of gamma_y
                V = quadgk(@(t) arrayfun(@(ti) fundamentalsol(x, yt(ti)), t) * norm(y2 - y1), 0, 1);
                val(i,j) = val(i,j) + V*X(k);
            end
        end
    end

end