import io
from sys import argv

with open(argv[1]+".o", "rb") as f:
    bindata = bytearray(f.read())

f = open(argv[1]+".h","w")
print("static char "+argv[1]+"[] = {",file=f)
for i in range(len(bindata)):
    print("0x%02x," %bindata[i],file=f)
print("};", file=f)
f.close()
