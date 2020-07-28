#!/bin/bash

# script for downloading namelist
# does some fancy html parsing using pup
# then pipes that to jq for json cleanup
# then holidays are markupped as such

# appearently, there are duplicates.
# those are removed by sort

something_not_installed=""
dependencies=(curl pup jq paste awk grep cut rev sort)

for dep in dependencies; do
    if command -v $dep &>/dev/null; then
        echo $dep " not installed"
        something_not_installed="yes"
    fi
done

if [ "$something_not_installed" = "yes" ]; then
    exit 1
fi

url="https://www.svenskaakademien.se/svenska-akademien/almanackan/akademialmanackan/namnlista?page=[0-39]"
file="all.csv"

# header
echo "Namn,Dag,Månad,Ingår i namnlängden,Typ" > $file

# holidays are included as well
holidays="Allhelgonadagen|Johannes Döparens dag|Juldagen|Kyndelsmässodagen|Marie Bebådelsedag|Nyårsdagen|Skottdagen|Tjugondedag jul|Trettondedag jul|Värnlösa barns dag"

curl -L $url \
| pup 'table tbody tr' json{} \
| jq -r '.[].children[] | if .children then .children[].text else .text end | split("/") | .[]' \
| paste -d',' - - - - \
| sort -t, -u -k 3,3n -k 2,2n -k 1,1 \
| awk "BEGIN { ORS=\"\" } /$holidays/ { print; print \",Högtid\n\"; next} { print; print \",Namn\n\";}" \
>> $file

remove_n_cols(){
    rev | cut -d, -f$(($1 + 1))- | rev
}

# header
echo "Namn,Dag,Månad" | tee namnsdagar.csv namnlängd.csv högtider.csv >/dev/null

grep -E 'Namn$' $file | remove_n_cols 2 >> namnsdagar.csv
grep ',Ja,' $file | grep -E 'Namn$' | remove_n_cols 2 >> namnlängd.csv
grep -E 'Högtid$' $file | remove_n_cols 2 >> högtider.csv