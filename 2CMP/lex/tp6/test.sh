#!/bin/bash

CRYPT_KEY=10

file="$1"
file2="${2:-$file}"
file3="${3:-$file2}"
file4="${4:-out.from.lex}"
file5="${5:-$file3}"
file6="${6:-$file3}"

if [[ -z "$file" ]]
then
    echo -e "Usage: \t./test.sh file_for_tp_6_1 [file_for_tp_6_2] [file_in_for_tp_6_3] [file_out_for_tp_6_3][file_for_tp_5][file_for_polish_checker]"
    exit 1
fi

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

echo -e "Running copie.\n\nCopie <$file3> in <$file4>)"
echo
echo > "$file4"
echo "-------- Pgm output ----------"
./copie_files "$file3" "$file4"
echo "cat $file4"
cat "$file4"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "Running crypt.\n\Encrypting <$file3> in <$file3.crypt>)"
echo
echo > "$file3.crypt"
echo "-------- Pgm output ----------"
./crypt "$file3" "$file3.crypt" $CRYPT_KEY
echo "cat $file3.crypt"
cat "$file3.crypt"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "Running crypt.\n\Decrypting <$file3.crypt> in <$file3.decrypt>)"
echo
echo > "$file3.decrypt"
echo "-------- Pgm output ----------"
./decrypt "$file3.crypt" "$file3.decrypt" $CRYPT_KEY
echo "cat $file3.decrypt"
cat "$file3.decrypt"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "Running crypt.\n\Decrypting <$file3.crypt> in <$file3.decrypt>)"
echo
echo > "$file3.decrypt"
echo "-------- Pgm output ----------"
./decrypt "$file3.crypt" "$file3.decrypt" $CRYPT_KEY
echo "cat $file3.decrypt"
cat "$file3.decrypt"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "Running print nb.\n\nPrinting numbers from user input"
echo
echo "-------- Pgm output ----------"
./print_nb
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "Running calc.\n\nCalc from user input"
echo
echo "-------- Pgm output ----------"
./calc
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "Running pgm analysor.\n\nPrint operator, ... from <$file5>"
echo
echo "-------- Pgm output ----------"
./pgm_analysor "$file5"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "Running polish syntax analysor - no automata.\n\nComment correctness of expression from <$file6>"
echo
echo "-------- Pgm output ----------"
./polish_syntax_checker "$file6"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }

echo -e "Running polish syntax analysor - with automata.\n\nComment correctness of expression from <$file6>"
echo
echo "-------- Pgm output ----------"
./polish_syntax_checker_automate "$file6"
echo "------------------------------"
echo

[[ $? -eq 0 ]] && echo "Looks good ?" || { echo "Execution fail"; exit 1; }