CURRENT_DIR=$(pwd)
cd "$(dirname $(which xhpl))"
mpirun -np 4 xhpl >> $CURRENT_DIR/test_hpl.log
