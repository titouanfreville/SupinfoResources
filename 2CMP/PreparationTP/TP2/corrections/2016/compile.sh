#/bin/bash
file="$1"
lex -o "$file.c" "$file.l" && gcc -o "$file" "$file.c"
cmd="./$1 $2"
shift
shift
for i in "$@"
do
    cmd="$cmd $i"
done
$cmd