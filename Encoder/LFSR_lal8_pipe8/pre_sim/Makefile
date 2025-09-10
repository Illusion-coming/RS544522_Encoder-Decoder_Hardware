top_name =  tb_rs544522_lal8_pipe_restruct_frontpad6
rtl_list =  rtl_list
sim_list =  sim_list
simv_name = simv
vpdpluse_name = vcdpluse
cov_file_name = coverage
vdb_name = vdbfl
nm=defaultp4
#$(simv_name)
my_incdir=../script
plusargs=DUMP_FSDB


NOR_VCS = vcs -full64 -sverilog +v2k -timescale=1ns/1ns            \
      -debug_acc+all -debug_region+cell+encrypt                              \
      +notimingcheck                                   \
      +nospecify                                       \
      +vcs+flush+all                                   \
      -o $(simv_name)   \
      -l compile.log	\
	  -f $(rtl_list).f  \
	  -f $(sim_list).f \
	  +incdir+$(my_incdir) \
	  -top $(top_name) \
	  +delay_mode_path 

VERDI_SW = -P \
${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab  \
${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a

#run option
RUN_GUI = -R -gui -l run.log
RUN_VPD = -R +vpdfile+$(vpdpluse_name).vpd -l run.log
RUN_COV = -R  $(COV_SW) -cm_name $(vdb_name) -cm_dir $(cov_dir)/$(cov_file_name) -l run.log  -cm_hier  ./covfl  
RUN_VER = -R +fsdb+autoflush+plusargs -l run.log 

fl:
	rm -rf rtl_list.f;  rm -rf sim_list.f;  
	find ../rtl \
    -type f \
    \( -name "*.v" -o -name "*.h" -o -name "*.sv" \) \
    -print > rtl_list.f;
	find ../testbench \
    -type f \
    \( -name "*.v" -o -name "*.h" -o -name "*.sv" \) \
    -print > sim_list.f;

clean:
	rm -rf csrc
	rm -rf simv.daidir
	rm -rf ucli.key
	rm -rf *.log
	rm -rf *.conf

run_vcs:
	$(NOR_VCS) $(VERDI_SW) $(RUN_VER)

vd:
	verdi -sv -f $(rtl_list).f -f $(sim_list).f -ssf *.fsdb -rcFile ~/dark.rc -nologo  & 

versim:
	fl run_vcs vd