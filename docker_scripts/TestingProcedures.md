# To test if the instance was created correctly

## Test ProjectedTexture (C++ based image creation used for ply-to-png creation for avatar3d)
cd
cd ProjectedTexture/build
run: xvfb-run ./ProjectedTexture ../model.ply ../model.jpg test.png
../
.......
