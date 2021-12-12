AS=../../minias/minias
LD=../../neatld/nld 
SRCDIR=./asm
RESDIR=./result

rm -f -r ${RESDIR}
mkdir ${RESDIR}
for name in ${SRCDIR}/*.s; do 
    name=${name#${SRCDIR}/}
    name=${name%.s}
	$AS -o ${RESDIR}/$name.o ${SRCDIR}/$name.s
	$LD -s -e -o ${RESDIR}/$name.bin ${RESDIR}/$name.o 
	if cmp -s "${SRCDIR}/$name.ref" "${RESDIR}/$name.bin"
   	then
   	   echo "Testcase $name ok." >>${RESDIR}/results.log 
 	else
      echo "Testcase $name fail.">>${RESDIR}/results.log 
   	fi
done



