awk '
	BEGIN{
		print "*** Grade Report for the ABC course ***"
		max=0
		min=100
	}
	NR>1{
		sum=$3+$4+$5
		avg+=sum
		
		if(sum<60){
			print $1,"F"
		}
		else if(sum<70){
			print $1,"D"	
		}
		else if(sum<75){
			print $1,"C-"	
		}
		else if(sum<80){
			print $1,"C"	
		}
		else if(sum<85){
			print $1,"B-"	
		}
		else if(sum<90){
			print $1,"B"	
		}
		else if(sum<95){
			print $1,"A-"	
		}
		else {
			print $1,"A"	
		}
		if(sum>max){
			max=sum
		}
		if(sum<min){ 
			min=sum
		}
	}
	END{
		avg=avg/(NR-1)
		print "Number of students:",NR-1
		print "Highest Marks:",max
		print "Lowest Marks:",min
		print "Average Marks:",avg		
		print "*** End of Grade Report ***​"
	}
' marks.txt