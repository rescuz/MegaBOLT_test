 source ~/anaconda3/bin/activate vcf && \
echo start at `date` && \
perl /hwfs2/project/MegaBOLT_MAPHGAP/shell/compare_bam/shell/stat_perl/compareBAM.pl  /hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/BigFiles/NA12878-v1/Alignment/NA12878-v1.bwa.markdup.bqsr.bam /storeData/ztron/rawData/MegaBOLT/test/shell/prepare/Vchip/result/NA12878-v1/NA12878-v1/NA12878-v1.bwa.sortdup.bqsr.bam && ztron_bam=`~/anaconda3/envs/vcf/bin/samtools view /hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/BigFiles/NA12878-v1/Alignment/NA12878-v1.bwa.markdup.bqsr.bam |wc -l`
echo ztron_bam=$ztron_bam && \
echo end at `date` && if [ $JOB_ID ]; then echo "jobid=$JOB_ID" && qstat -j $JOB_ID | grep usage ; fi && echo Still_waters_run_deep >/hwfs2/project/MegaBOLT_MAPHGAP/shell/compare_bam/shell/stat_perl/shell/s1.vchip.bam.NA12878-v1.sh.sign 
