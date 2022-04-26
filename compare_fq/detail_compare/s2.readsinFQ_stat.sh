#rm -fr 50sample.fqstat.list
rm -fr 50sample.fqstat.read
rm -fr 50sample.fqread.diff
#rm -fr 50sample.fqread.consistency
#ls -d /hwfs2/project/MegaBOLT_MAPHGAP/shell/compare_fq/shell/shell/*.fqstat.sh.o*  >50sample.fqstat.list && \
cat 50sample.fqstat.list |while read line
do
	sample=`echo $line |awk -F"." '{print $(NF-4)}'`
	eline=`echo $line|sed 's/sh.o/sh.e/'`
	reads=$(cat $line|grep hwfs2 |awk '{sum+=$2}END{print sum}')
	readse=$(cat $eline|grep sequences |awk '{sum+=$12}END{print sum}')
	echo -e "$sample\t$reads\t$readse"  >>50sample.fqstat.read
done
cat 50sample.fqstat.read|cut -f1|sort -u|while read sam
do
	#cat 50sample.fqstat.read|grep $sam |awk 'BEGIN{OFS="\t"}{readinztron+=$2;readinmega+=$3}END{val=sprintf ("%.2f%",(readinmega/readinztron)*100);print $1,val}'  >>50sample.fqread.consistency
	cat 50sample.fqstat.read|grep $sam |awk 'BEGIN{OFS="\t"}{readinztron+=$2;readinmega+=$3}END{printf "%.2f\n",(readinztron - readinmega)}'  >>50sample.fqread.diff
done
