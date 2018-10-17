awk ' (NR>1){
print $1,$2,$NF }' marks.txt