rm -fr ztron.vchip.list
rm -fr ztron.echip.list
rm -fr megabolt.vchip.list
rm -fr megabolt.echip.list
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/WGS/Office/outdir01/result/Analysis_result/*/CNV/*.cnvnator.cnv.xls|egrep -v "10931353|10931366|10931367|10642383" |grep -v raw >ztron.vchip.list
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir02/result/Analysis_result/*/CNV/*.cnvnator.cnv.xls |grep -v raw  >>ztron.vchip.list
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/WGS/Office/outdir01_2nd/result/Analysis_result/*/CNV/*.cnvnator.cnv.xls |grep -v raw  >>ztron.vchip.list
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/Megabolt_CNV_SV/Vchip/outdir01/result/Analysis_result/*/CNV/*.cnvnator.cnv.xls|egrep -v "10931353|10931366|10931367|10642383"  |grep -v raw  >>megabolt.vchip.list
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/Megabolt_CNV_SV/Vchip/outdir02/result/Analysis_result/*/CNV/*.cnvnator.cnv.xls |grep -v raw  >>megabolt.vchip.list

ls -d /hwfs2/project/MegaBOLT_MAPHGAP/WGS/Office/outdir02/result/Analysis_result/*/CNV/*.cnvnator.cnv.xls |grep -v raw >ztron.echip.list
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/WGS/NA12878/outdir01/result/Analysis_result/*/CNV/*.cnvnator.cnv.xls |grep -v raw  >>ztron.echip.list
ls -d /hwfs2/project/MegaBOLT_MAPHGAP/Megabolt_CNV_SV/Echip/outdir01/result/Analysis_result/*/CNV/*.cnvnator.cnv.xls |grep -v raw  >megabolt.echip.list

