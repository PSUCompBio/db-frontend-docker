cd /home/$UNAMEX
git clone -b 13.0 https://gitlab.freedesktop.org/mesa/mesa.git
cd mesa
mkdir build
cd build
../autogen.sh
../configure  --prefix=/usr/local/mesa --enable-opengl --disable-gles1 --disable-gles2 --disable-va --disable-xvmc --disable-vdpau --enable-shared-glapi --disable-texture-float --enable-gallium-llvm --enable-llvm-shared-libs  --with-gallium-drivers=swrast,swr  --disable-dri --with-dri-drivers= --disable-egl --with-egl-platforms= --disable-gbm --disable-glx --disable-osmesa --enable-gallium-osmesa --with-llvm-prefix=/usr/local/llvm --disable-llvm-shared-libs

make -j8
make install
echo " -------------------------------------------------------------------"
echo " ----------           Complete MESA Install                ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
