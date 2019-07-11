cd ../../
cd encoder
make

# LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH ./mcufont 
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

cd ../fonts
../encoder/mcufont import_ttf DejaVuSans.ttf 12
../encoder/mcufont filter DejaVuSans12.dat 0-255 0x2010-0x2015
../encoder/mcufont rlefont_export DejaVuSans12.dat

cd ../examples/render_bmp
make -B

# ./render_bmp -a l -f DejaVuSerif16
./render_bmp -a l -f DejaVuSans12
