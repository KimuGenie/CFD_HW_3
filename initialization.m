function u = initialization(A, dx, dt, tend)

u = zeros(pi/dx+1, int32(tend/dt+1));

for i=1:pi/dx+1
    x = (i-1)*dx;
    u(i, 1) = A*sin(x);
end

end