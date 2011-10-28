#!/bin/sh

#	Shell script to help maintain a set of directories
#	created from Reddit_Image_Scraper
if [ $# != 1 ];
then 
	echo "Usage: $0 [min # of pics]\n             or\n       $0 -1"
	exit 0
fi
if [ $1 = -1 ];
then
        for file in *
	do
        	if [ -d $file ] ;
        	then
                	num=`ls $file | wc -l`
                        echo -e "$file : $num"
                fi
done
exit 0
fi
for file in *
do
	if [ -d $file ] ;
	then
		num=`ls $file | wc -l`
		if [ $num -lt $1 ];
		then 
			echo -e "$file : $num\nDeleting $file"
			rm -r -f $file
		fi
	fi
done
exit 0
