awk '
	NR>1 { if($2~"M"){
		   		print $0 > "male.txt"
		   }	
		}

	{ 
		if($2~"F"){
		   	print $0 > "female.txt"
		}	
	}
' marks.txt