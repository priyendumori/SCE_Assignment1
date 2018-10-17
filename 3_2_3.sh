awk '
	NR>1{
		sum=$3+$4+$5
		print $1,sum
	}
' marks.txt