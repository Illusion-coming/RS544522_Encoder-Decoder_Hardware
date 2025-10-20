#!/bin/csh -f

cd /home/EDA/work/IEEE802_3_CZ/Hardware/RS_Decoder/pre_sim

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/opt/synopsys/vcs_2022.06/T-2022.06/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

