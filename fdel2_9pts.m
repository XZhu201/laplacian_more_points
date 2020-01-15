function Laplacian = fdel2_9pts(u,h)

Lrow = size(u,1);
Lcol = size(u,2);

Laplacian = zeros(Lrow, Lcol);

% The matrix
matrix9_3 = [0 0 -1/12 0 0 ; ...
    0 0 4/3 0 0 ; ...
    -1/12 4/3 -5 4/3 -1/12; ...
    0 0 4/3 0 0 ; ...
    0 0 -1/12 0 0 ];

% calculation
temp = conv2(u,matrix9_3,'valid')/h/h;
Laplacian(3:end-2,3:end-2)=temp;

end

