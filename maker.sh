file_name=$1
len=`expr ${#file_name} - 4`
file_name="${file_name:0:len}"

nasm -f elf64 $file_name.asm
ld -o $file_name $file_name.o
./$file_name

rm $file_name.o
rm $file_name