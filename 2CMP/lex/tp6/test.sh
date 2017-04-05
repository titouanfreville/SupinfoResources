#!/bin/bash

file="$1"
echo "1: $1 --- 2: $2"
file2="${2:-$file}"
echo "file2: $file2 --- file: $file"
echo -e "Running copie.\n\nCopie should write the file you provided as argument in the stdout (provided file: <$file>)"
echo
echo "-------- Pgm output ----------"
./copie_from_lex "$file"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning compt voyelle.\n\nShould show a message with the number of voyelle in provided file (<$file>) "
echo
echo "-------- Pgm output ----------"
./compt_voyelle "$file"
echo "------------------------------"
echo
[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning compt consonne.\n\nShould show a message with the number of consonne in provided file (<$file>) "
echo
echo "-------- Pgm output ----------"
./compt_consonne "$file"
echo "------------------------------"
echo
[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning compt mot.\n\nShould show a message with the number of mot in provided file (<$file>) "
echo
echo "-------- Pgm output ----------"
./compt_mot "$file"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning compt linebreak.\n\nShould show a message with the number of linebreak in provided file (<$file>) "
echo
echo "-------- Pgm output ----------"
./compt_linebreak "$file"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning compt allchars.\n\nShould show a message with the number of allchars in provided file (<$file>) "
echo
echo "-------- Pgm output ----------"
./compt_allchars "$file"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning compt chars_notarbreak.\n\nShould show a message with the number of chars_notarbreak in provided file (<$file>) "
echo
echo "-------- Pgm output ----------"
./compt_chars_notarbreak "$file"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning compt class.\n\nShould show a message with the number of class in provided file (<$file>) "
echo
echo "-------- Pgm output ----------"
./compt_class "$file"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning filter comment.\n\nShould show the initial file without // single line comments (provide file <$file>) "
echo
echo "------- Initial file ---------"
cat "$file2"
echo
echo "------------------------------"
echo
echo "-------- Pgm output ----------"
./filt_sl_comment "$file2"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning filter comment.\n\nShould show the initial file without /* */ multi line comments (provide file <$file>) "
echo
echo "------- Initial file ---------"
cat "$file2"
echo
echo "------------------------------"
echo
echo "-------- Pgm output ----------"
./filt_ml_comment "$file2"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "\n\nRunning filter comment.\n\nShould show only correctly formated " " (escape char is !) strings (provide file <$file>) "
echo
echo "------- Initial file ---------"
cat "$file2"
echo
echo "------------------------------"
echo
echo "-------- Pgm output ----------"
./filt_chars "$file2"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }
