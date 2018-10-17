awk '
	BEGIN{
		print "["
	}
	{
		for(i=2;i<NF-1;i++){
			name=name" "$i
		}
		id=substr($1,1,length($1)-1)
		year=substr($(NF-1),2,length($(NF-1))-2 )
		rating=$NF
		if(NR>1)	print ","
		print "\t{"
		print "\t\"ID\" : ""\""id"\","
		print "\t\"Name\" : ""\""name"\","
		print "\t\"Year\" : ""\""year"\","
		print "\t\"Rating\" : ""\""rating"\""
		printf "\t}"
		name=""
	}
	END{
		print "\n]"
	}
' imdb-top-250.txt