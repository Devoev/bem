function [p1,p2] = mkGeom(N)
    d = 0.5;
    p1 = [linspace(0,d,N); zeros(1,N)]';
    p2 = [linspace(0,d,N); d*ones(1,N)]';
end