awk '
	BEGIN{
		top=$1
		max=0
	}
	NR>1{
		sum=$3+$4+$5
		avg+=sum
		
		st[$1]=sum
		if(sum>max){
			max=sum
			top=$1
		}
		
	}
	END{
		print "Topper:",top;
		avg=avg/(NR-1)
		print "Above average: "
		for(s in st){
			if(st[s]>avg){
				print s
			}
		}
	}
' marks.txt