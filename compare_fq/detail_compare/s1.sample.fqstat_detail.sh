source ~/anaconda3/bin/activate python38  && \
echo start at `date` && \
seqkit  common  -s  /hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/BigFiles/NA12878-v1/CleanData/NA12878-v1.V300067690_L04_1.clean_2.fq.gz   /storeData/ztron/rawData/MegaBOLT/test/shell/prepare/Vchip/result/NA12878-v1/NA12878-v1/NA12878-v1_2.fq.gz  -j 8   -o /hwfs2/project/MegaBOLT_MAPHGAP/shell/compare_fq/shell/shell/process/NA12878-v1_s1.2common.fq.gz  && \
fq_num=`zcat /hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/BigFiles/NA12878-v1/CleanData/NA12878-v1.V300067690_L04_1.clean_2.fq.gz|grep -c '^+'`   && \
echo -e "/hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/BigFiles/NA12878-v1/CleanData/NA12878-v1.V300067690_L04_1.clean_2.fq.gz\t$fq_num"  && \
seqkit  common  -s  /hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/BigFiles/NA12878-v1/CleanData/NA12878-v1.V300067690_L04_1.clean_1.fq.gz   /storeData/ztron/rawData/MegaBOLT/test/shell/prepare/Vchip/result/NA12878-v1/NA12878-v1/NA12878-v1_1.fq.gz  -j 8   -o /hwfs2/project/MegaBOLT_MAPHGAP/shell/compare_fq/shell/shell/process/NA12878-v1_s1.1common.fq.gz  && \
fq1_num=`zcat /hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/BigFiles/NA12878-v1/CleanData/NA12878-v1.V300067690_L04_1.clean_1.fq.gz|grep -c '^+'`   && \
echo -e "/hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/BigFiles/NA12878-v1/CleanData/NA12878-v1.V300067690_L04_1.clean_1.fq.gz\t$fq1_num"  && \
echo end at `date` && \
echo Still_waters_run_deep >/hwfs2/project/MegaBOLT_MAPHGAP/shell/compare_fq/shell/shell/Vchip.NA12878-v1.1.fqstat.sh.sign
