awk '
{ 
	line[$0]++ 
} 
END {
	for (l in line) 
	{ 
		print l
	}
}'