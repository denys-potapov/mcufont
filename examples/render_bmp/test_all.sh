cd ../../
cd encoder 
make mcufont

# LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH ./mcufont 
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

cd ../fonts
../encoder/mcufont import_ttf DejaVuSansMono.ttf 16
../encoder/mcufont filter DejaVuSansMono16.dat 0-255 0x2010-0x2015
../encoder/mcufont rlefont_export DejaVuSansMono16.dat

cd ../examples/render_bmp
make -B

# ./render_bmp -a l -f DejaVuSerif16
./render_bmp -a l -w 120 -f DejaVuSansMono16
