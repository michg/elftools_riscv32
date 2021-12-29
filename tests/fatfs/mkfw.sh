as=../../minias/minias
ld=../../neatld/nld
ar=../../ar/ar
SRCDIR=./src
RESDIR=./result

rm -f -r ${RESDIR}
mkdir ${RESDIR} 

$as -o ${RESDIR}/start.o ${SRCDIR}/start.s
$as -o ${RESDIR}/sdmm.o ${SRCDIR}/sdmm.s
$as -o ${RESDIR}/ff.o ${SRCDIR}/ff.s
$as -o ${RESDIR}/loader.o ${SRCDIR}/loader.s
$as -o ${RESDIR}/xprintf.o ${SRCDIR}/xprintf.s
$ar -rcs  ${RESDIR}/sd.a  ${RESDIR}/sdmm.o ${RESDIR}/ff.o ${RESDIR}/loader.o
$ld -s -e -p -mc=0 -o ${RESDIR}/firmware.bin ${RESDIR}/start.o ${RESDIR}/sd.a ${RESDIR}/xprintf.o
python3 mkhex.py ${RESDIR}/firmware






