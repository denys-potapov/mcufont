cd ../../
cd encoder
make

# LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH ./mcufont 
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

cd ../fonts
../encoder/mcufont import_ttf DejaVuSans.ttf 12
../encoder/mcufont filter DejaVuSans12.dat 0-255 0x2010-0x2015
../encoder/mcufont rlefont_export DejaVuSans12.dat

../encoder/mcufont import_ttf DejaVuSans.ttf 14
../encoder/mcufont filter DejaVuSans14.dat 0-255 0x2010-0x2015
../encoder/mcufont rlefont_export DejaVuSans14.dat

../encoder/mcufont import_ttf DejaVuSansMono.ttf 12
../encoder/mcufont filter DejaVuSansMono12.dat 0-255 0x2010-0x2015
../encoder/mcufont rlefont_export DejaVuSansMono12.dat

../encoder/mcufont import_ttf PT_mono.ttf 12
../encoder/mcufont filter PT_mono12.dat 0-255 0x2010-0x2015
../encoder/mcufont rlefont_export PT_mono12.dat
make fonts.h

cd ../examples/render_bmp
make -B

# ./render_bmp -a l -f DejaVuSerif16
./render_bmp -a l -w 120 -o out_12.bmp -f DejaVuSans12
./render_bmp -a l -w 120 -o out_14.bmp -f DejaVuSans14
./render_bmp -a l -w 120 -o out_mono.bmp -f DejaVuSansMono12
./render_bmp -a l -w 120 -o out_pt.bmp -f PT_mono12