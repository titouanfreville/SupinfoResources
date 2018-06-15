#/bin/bash
file="$1"
lex -o "$file.c" "$file.l" && gcc -o "$file" "$file.c"