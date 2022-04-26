rm 50bamstat.list
rm -fr 50sample.megabolt_ztron_compare.list
rm -fr 50sample.megabolt_ztron_comparediff
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/shell/compare_bam/shell/stat_perl/shell/s1.*bam.*.sh.o* >50bamstat.list && \
cat 50bamstat.list |while read olog
do
	sam=$(echo $olog|awk -F'.' '{print $(NF-2)}' )
	arr=($(cat $olog|grep "tp_num" |awk -F'[=|z]' 'BEGIN{OFS=" "}{print $2,$4}'))
	#echo ${arr[0]}   ${arr[1]}
	num1=${arr[0]}; num2=${arr[1]};
	#val=$((${arr[0]}/${arr[1]}))
	#val=$(($num1/$num2))
	#val=`expr $num1/$num2`
	#echo "$val" 
	diff=$((arr[1]-arr[0]))
	echo $diff >> 50sample.megabolt_ztron_comparediff
	awk -v sam=$sam   'BEGIN{printf "%s\t%.2f%\n",sam,('${arr[0]}'/'${arr[1]}')*100 }' >>50sample.megabolt_ztron_compare.list

done
