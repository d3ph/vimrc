#!/bin/bash

# ${arr[@]} # All of the items in the array
# ${!arr[@]} # All of the indexes in the array
# ${#arr[@]} # Number of items in the array
# ${#arr[0]} # Length of item zero

# CSV:
query="select concat_ws(',', quote(concat('\"\'%> ', Host, ' <*.)')), quote(char_length(Host))) from user"
# -- OR --
# INTO OUTFILE '/tmp/hosts.csv'
# FIELDS TERMINATED BY ','
# ENCLOSED BY '"'
# LINES TERMINATED BY '\n';
dbname="mysql"
array=()
while read line; do
    array+=("$line")
done < <(mysql -uroot -S /tmp/mysql.sock ${dbname} -sNoBe "${query}")

for index in ${!array[*]}
do
    printf "%4d: %s\n" $index "${array[$index]}"
done

function joined { printf "1=1";printf "%s" "${@/#/ AND }"; }

echo ${#array[@]} elements
joined "${array[@]}"
