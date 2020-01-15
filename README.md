# laplacian_more_points
 To replace *del2* in matlab with higher accuracy.

 The *del2* function in Matlab only uses a [5-point stencil](https://en.wikipedia.org/w/index.php?title=Five-point_stencil&oldid=930249134), which is $\mathcal{O}(h^2)$. Here, the function ***fdel2_xxx.m*** uses a [higher accuracy](https://www-m2.ma.tum.de/foswiki/pub/M2/Allgemeines/NumPro2CSESS13/tutorial_08_pde_finite_diff_2_solution.pdf) [(or see this)](https://en.wikipedia.org/w/index.php?title=Finite_difference_coefficient&oldid=930406921), which is $\mathcal{O}(h^4)$.

 In the file *test.mlx*, I compared the results with different Laplacian matrics and also by calling *fdel2_xxx.m* to that with matlab *del2*.
