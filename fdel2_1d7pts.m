function Laplacian = fdel2_1d7pts(u,h)

Lrow = size(u,1);
Lcol = size(u,2);

Laplacian = zeros(Lrow, Lcol);

% construct the matrix
matrix = zeros(7,7);

mid = 4;

array = [1/90	-3/20	3/2	-49/18	3/2	-3/20	1/90];
matrix(:,mid) = array;
matrix(mid,:) = array;
matrix(mid,mid) = 2*(-49/18);

% calculation
temp = conv2(u,matrix,'valid')/h/h; 
Laplacian(4:end-3,4:end-3)=temp;  % NOTE: the boundary should be close to 0 enough!

end

