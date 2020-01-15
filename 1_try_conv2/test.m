clear
close all

%% construct the grid
Lx = 100;
Ly = 100;

Rx = 10;
Ry = 10;

x = linspace(-Rx,Rx,Lx);
y = linspace(-Ry,Ry,Ly);

[mx,my] = meshgrid(x,y);

dx = x(2)-x(1);
dy = y(2)-y(1);

%% construct a 2D function
f = exp( -mx.^2 - 2*my.^2 );

figure;
mesh(mx,my,f);
title('f')

%% using del2  
fdel2 = 4*del2(f,dx,dy);

figure;
mesh(mx,my,fdel2);
title('fdel2')

%% use Five-point stencil  (https://en.wikipedia.org/wiki/Discrete_Laplace_operator)
matrix5 = [0, 1, 0; 1, -4, 1; 0, 1, 0];

temp = conv2(f,matrix5,'valid')/dx/dy;
f5pt = zeros(Lx,Ly);
f5pt(2:end-1,2:end-1)=temp;

figure;
mesh(f5pt);
title('f5pt')

% check the difference
diff5pt = sum(sum( fdel2(2:end-1,2:end-1) - temp ))


%% use Nive-point stencil  (https://en.wikipedia.org/wiki/Discrete_Laplace_operator)
matrix9 = [0.25, 0.5, 0.25; 0.5, -3, 0.5; 0.25, 0.5, 0.25];

temp = conv2(f,matrix9,'valid')/dx/dy;
f9pt = zeros(Lx,Ly);
f9pt(2:end-1,2:end-1)=temp;

figure;
mesh(f9pt);
title('f9pt')

% check the difference
diff9pt = sum(sum( fdel2(2:end-1,2:end-1) - temp ))


%% use Nive-point stencil 2  (https://en.wikipedia.org/wiki/Discrete_Laplace_operator)
matrix9 = [0.25, 0.5, 0.25; 0.5, -3, 0.5; 0.25, 0.5, 0.25];

temp = conv2(f,matrix9,'valid')/dx/dy;
f9pt = zeros(Lx,Ly);
f9pt(2:end-1,2:end-1)=temp;

figure;
mesh(f9pt);
title('f9pt')

% check the difference
diff9pt = sum(sum( fdel2(2:end-1,2:end-1) - temp ))
