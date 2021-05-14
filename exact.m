function uex = exact(alpha, A, dx, dt, imax, nmax)

uex = zeros(imax, nmax);

for n=1:nmax
    for i=1:imax
        uex(i, n) = A*exp(-alpha*dt*(n-1))*sin(dx*(i-1));
    end
end

end