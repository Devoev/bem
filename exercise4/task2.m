N = 100;
d = 2;
v = [1,1,1];

% Generate random and translated points
rng(42)
x = [rand(N,1), rand(N,1), rand(N,1)];
xt = x + d * v/norm(v);

% Generate interaction matrix
G = zeros(N,N);
for i = 1:N
    for j = 1:N
        xi = x(i,:);
        xtj = xt(j,:);
        G(i,j) = 1/(4*pi*norm(xi - xtj));
    end
end

% Generate random N x N matrix
A = rand(N,N);

% Plot singular values
[~,Sg,~] = svd(G);
[~,Sa,~] = svd(A);

figure
semilogy(diag(Sg))
hold on
semilogy(diag(Sa))
xlabel('Index $j$', 'Interpreter', 'Latex')
ylabel('Singular value $\sigma_j$', 'Interpreter', 'Latex')
legend('Interaction matrix $G$', 'Random matrix A', 'Interpreter', 'Latex')
grid on
