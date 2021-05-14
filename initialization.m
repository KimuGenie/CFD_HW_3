function [u, imax, nmax] = initialization(A, dx, dt, tend)

imax = round(pi/dx)+1;
nmax = ceil(tend/dt+1);

u = zeros(imax, nmax);

for i=1:imax
    x = (i-1)*dx;
    u(i, 1) = A*sin(x);
end

end