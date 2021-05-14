function u = D_F(u, alpha, dx, dt, imax, nmax)

k=2*alpha*dt/(dx^2);

%FTCS
for i=2:imax-1
    u(i, 2) = u(i, 1)+k/2*(u(i+1, 1)-2*u(i, 1)+u(i-1, 1));
end

%DuFort-Frankel
for n=2:nmax-1
    for i=2:imax-1
        u(i, n+1) = ((1-k)*u(i, n-1)+k*(u(i+1, n)+u(i-1, n)))/(1+k);
    end
end

end