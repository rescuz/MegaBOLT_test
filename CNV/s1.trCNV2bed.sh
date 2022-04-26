#sh /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/shell/s0.get_CNV.sh
dir=/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/shell
mdir=/hwfs2/project/MegaBOLT_MAPHGAP/Megabolt_CNV_SV/Vchip/outdir01/result/Analysis_result
cat $dir/ztron.vchip.list|while read line
do
	sample=${line##*/}
	sample=${sample%%.*}
	cat $line|grep -v coordinates|awk -F"[:|\t|\-]" 'BEGIN{OFS="\t"}{print $1,$2,$3,$4}' >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/ztron/vchip/$sample.cnvnator.prebed && \
	cat $mdir/$sample/CNV/$sample.cnvnator.cnv.xls|grep -v coordinates|awk -F"[:|\t|\-]" 'BEGIN{OFS="\t"}{print $1,$2,$3,$4}' >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/megabolt/vchip/$sample.cnvnator.prebed && \
	cat /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/ztron/vchip/$sample.cnvnator.prebed |grep deletion|cut -f2- >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/ztron/vchip/split/deletion.$sample.cnvnator.bed && \
	cat /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/ztron/vchip/$sample.cnvnator.prebed |grep duplication|cut -f2- >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/ztron/vchip/split/duplication.$sample.cnvnator.bed && \
	cat /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/megabolt/vchip/$sample.cnvnator.prebed |grep deletion|cut -f2- >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/megabolt/vchip/split/deletion.$sample.cnvnator.bed && \
	cat /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/megabolt/vchip/$sample.cnvnator.prebed |grep duplication|cut -f2- >/hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/process/bed/megabolt/vchip/split/duplication.$sample.cnvnator.bed 
done
sh /hwfs2/project/MegaBOLT_MAPHGAP/shell/CNV/shell/s3.compare_CNV.sh   && \
echo done at `date`

###         ####3

