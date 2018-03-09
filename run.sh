LINK="/home/minhtanle/Test"
FILE_NAME="Test"
mkdir $FILE_NAME
cd $LINK
a=0
b=0
NUMBEROFMONTH=$(cal $month $year | xargs echo | awk '{print $NF}')
while [ "$b" -le $NUMBEROFMONTH ] 
do	
	LASTDATE=$(date -d "`date +%Y%m01` +1 month 0 day" +%Y-%m-%d)
	DATE="$b day";
	TESTDATE=$(date -d "$DATE" "+%Y-%m-%d")
	if [ "$TESTDATE" = "$LASTDATE" ]
	then
		break
	fi
	mkdir $TESTDATE
		while [ "$a" -lt 10 ]  
		do
   		DATETIME="$(date +%Y-%m-%d-%T)"
  	 	touch $LINK/$TESTDATE/$DATETIME
   		Output_File=$LINK/$TESTDATE/$DATETIME
		echo " <!DOCTYPE html>
			<html>
			<head>
			<title>Page Title</title>
			<script type='text/javascript'>
				window.open('https://www.google.com.vn/?gfe_rd=cr&ei=HZBbWNGFF-  					Pc8gfH24z4Bw#q=$DATETIME');
			</script>
			</head>
			<body>
			</body>
			</html> " > $Output_File
   		sleep 1	
   		a=`expr $a + 1`
		done
	sleep 1
	b=`expr $b + 1`

done

