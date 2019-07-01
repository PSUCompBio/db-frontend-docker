To test if the instance was created correctly

1) Was pythonocc-core obtained okay?
ls  (if you seee pythonocc-core directory this is a good sign)

2) Test PyGem
cd PyGem/tutorials
python3 RBFfinal.py 
Do you get a finalmesh.vtk?

3) Test python-based image creation
cd
ls -ltr vtk-image-write
Do you see sphere.png that is 9096 kb?

4) Test FemTech
cd
cd FemTech/build/examples/ex9
mpirun -n 1 ex9 1-elt-cube.k
Does it run okay?

5) Test MergePolyData (c++ based image creation used for ply-to-png creation for avatar3d)
cd
cd MergePolyData/build/examples/ply-to-png
.......

6) Test website
