source ~/anaconda3/bin/activate R3.6
result=/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/result
rm -fr $result/summary/vchip/CNV_compare.list 
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/ztron/vchip/*.cnvnator.prebed  >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/summary/ztron/vchip/vchip.prebed.list && \
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/megabolt/vchip/*.cnvnator.prebed  >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/summary/megabolt/vchip/vchip.prebed.list && \
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/ztron/vchip/split/deletion*.cnvnator.bed  >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/summary/ztron/vchip/deletion.vchip.bed.list && \
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/ztron/vchip/split/duplication*.cnvnator.bed  >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/summary/ztron/vchip/duplication.vchip.bed.list && \
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/megabolt/vchip/split/deletion*.cnvnator.bed  >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/summary/megabolt/vchip/deletion.vchip.bed.list && \
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/megabolt/vchip/split/duplication*.cnvnator.bed  >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/summary/megabolt/vchip/duplication.vchip.bed.list && \

echo -e "sample\tTP\tztron_num\tmegabolt_num\ttn\tfp\tfn\tprecision(%%)\trecall(%%)\tF1(%%)" >$result/summary/vchip/CNV_compare.list
cat /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/summary/ztron/vchip/vchip.prebed.list|egrep -v "10931353|10931366|10931367|10642383" |while read line
do
	dir=${line%/*}
	mdir=`echo $dir|sed  's/ztron/megabolt/g'`
	mline=`echo $line|sed  's/ztron/megabolt/g'`
	sample=${line##*/};sample=${sample%%.*}
	#echo line=$line mline=$mline  sample=$sample
	mkdir -p $result/summary/vchip/$sample
	bedtools intersect -a $dir/split/deletion.$sample.cnvnator.bed -b $mdir/split/deletion.$sample.cnvnator.bed -wo   > $result/summary/vchip/$sample/$sample.deletion.intersect && \
	bedtools intersect -a $dir/split/duplication.$sample.cnvnator.bed -b $mdir/split/duplication.$sample.cnvnator.bed -wo   > $result/summary/vchip/$sample/$sample.duplication.intersect  && \
	ztron_use=`perl /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/shell/s4.cnv_intersect_stat.pl    $result/summary/vchip/$sample/$sample.deletion.intersect  $result/summary/vchip/$sample/$sample.duplication.intersect` && \
	#echo $ztron_use
	ztron=`cat $line |wc -l`
	megabolt=`cat $mline |wc -l`
	tn=0; fp=$((megabolt-ztron_use))
	fn=$((ztron-ztron_use)) 
	pre=$[ztron_use*10000/megabolt]
	rec=$[ztron_use*10000/ztron]
	F1=$((2*ztron_use*10000/(ztron+megabolt))) && \
	echo -e  "$sample\t$ztron_use\t$ztron\t$megabolt\t$tn\t$fp\t$fn\t$pre\t$rec\t$F1" >>$result/summary/vchip/CNV_compare.list
done
echo done at `date`
