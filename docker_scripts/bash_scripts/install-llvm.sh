cd /home/$UNAMEX
git clone https://github.com/llvm/llvm-project.git
cd llvm-project/llvm
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/path/to/install/llvm -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_ENABLE_RTTI=ON -DLLVM_INSTALL_UTILS=ON -DLLVM_TARGETS_TO_BUILD:STRING=X86
make -j8
make install
echo " -------------------------------------------------------------------"
echo " ----------           Complete LLVM Install                ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
