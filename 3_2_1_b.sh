awk ' (NR>1 && NR<=4){
print $1,$2,$NF }' marks.txt