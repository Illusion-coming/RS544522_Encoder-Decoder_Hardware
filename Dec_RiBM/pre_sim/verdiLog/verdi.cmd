verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult /home/EDA/work/IEEE802_3_CZ/Hardware/Dec_RiBM/pre_sim/dump.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 1718 181
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 1718 818
wvSetCursor -win $_nWave2 66027.359882
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_syndrome/pre_sim/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvResizeWindow -win $_nWave2 -10 20 1718 818
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {dut/ref}
wvSelectGroup -win $_nWave2 {dut/ref}
wvSelectAll -win $_nWave2
wvSelectGroup -win $_nWave2 {dut}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_RiBM/pre_sim/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvResizeWindow -win $_nWave2 -10 20 1718 818
wvSetCursor -win $_nWave2 71705.273114 -snap {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_ribm_solver_3t"
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_ribm_solver_3t/dut/busy_o} \
{/tb_ribm_solver_3t/dut/clk_i} \
{/tb_ribm_solver_3t/dut/rst_ni} \
{/tb_ribm_solver_3t/dut/start_i} \
{/tb_ribm_solver_3t/dut/syn_valid_i} \
{/tb_ribm_solver_3t/dut/r_cnt\[5:0\]} \
{/tb_ribm_solver_3t/dut/dp0_w\[9:0\]} \
{/tb_ribm_solver_3t/dut/gamma_reg\[9:0\]} \
{/tb_ribm_solver_3t/dut/k_reg\[5:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[0:11\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[0\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[1\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[2\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[3\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[4\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[5\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[6\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[7\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[8\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[9\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[10\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[11\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/delta_reg\[0:21\]} \
{/tb_ribm_solver_3t/dut/b_reg\[0:11\]} \
{/tb_ribm_solver_3t/dut/theta_reg\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_ribm_solver_3t/v_dut\[0:10\]} \
{/tb_ribm_solver_3t/v_ref\[0:10\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1744319.423369 -snap {("G2" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 2)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_ribm_solver_3t"
wvGetSignalSetScope -win $_nWave2 "/tb_ribm_solver_3t"
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_ribm_solver_3t/dut/busy_o} \
{/tb_ribm_solver_3t/dut/clk_i} \
{/tb_ribm_solver_3t/dut/rst_ni} \
{/tb_ribm_solver_3t/dut/start_i} \
{/tb_ribm_solver_3t/dut/syn_valid_i} \
{/tb_ribm_solver_3t/dut/r_cnt\[5:0\]} \
{/tb_ribm_solver_3t/dut/dp0_w\[9:0\]} \
{/tb_ribm_solver_3t/dut/gamma_reg\[9:0\]} \
{/tb_ribm_solver_3t/dut/k_reg\[5:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[0:11\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[0\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[1\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[2\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[3\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[4\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[5\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[6\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[7\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[8\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[9\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[10\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[11\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/delta_reg\[0:21\]} \
{/tb_ribm_solver_3t/dut/b_reg\[0:11\]} \
{/tb_ribm_solver_3t/dut/theta_reg\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_ribm_solver_3t/v_dut\[0:10\]} \
{/tb_ribm_solver_3t/v_ref\[0:10\]} \
{/tb_ribm_solver_3t/sigma_dut\[0:11\]} \
{/tb_ribm_solver_3t/sigma_ref\[0:11\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_ribm_solver_3t/dut/busy_o} \
{/tb_ribm_solver_3t/dut/clk_i} \
{/tb_ribm_solver_3t/dut/rst_ni} \
{/tb_ribm_solver_3t/dut/start_i} \
{/tb_ribm_solver_3t/dut/syn_valid_i} \
{/tb_ribm_solver_3t/dut/r_cnt\[5:0\]} \
{/tb_ribm_solver_3t/dut/dp0_w\[9:0\]} \
{/tb_ribm_solver_3t/dut/gamma_reg\[9:0\]} \
{/tb_ribm_solver_3t/dut/k_reg\[5:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[0:11\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[0\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[1\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[2\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[3\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[4\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[5\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[6\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[7\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[8\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[9\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[10\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[11\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/delta_reg\[0:21\]} \
{/tb_ribm_solver_3t/dut/b_reg\[0:11\]} \
{/tb_ribm_solver_3t/dut/theta_reg\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_ribm_solver_3t/v_dut\[0:10\]} \
{/tb_ribm_solver_3t/v_ref\[0:10\]} \
{/tb_ribm_solver_3t/sigma_dut\[0:11\]} \
{/tb_ribm_solver_3t/sigma_ref\[0:11\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvSetPosition -win $_nWave2 {("G2" 4)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1744319.423369 -snap {("G2" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 808766.312595 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_ribm_solver_3t"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_ribm_solver_3t/Unnamed_\$tb_ribm_solver_3t_sv_325"
wvGetSignalSetScope -win $_nWave2 "/tb_ribm_solver_3t"
wvGetSignalSetScope -win $_nWave2 "/tb_ribm_solver_3t"
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_ribm_solver_3t/dut/busy_o} \
{/tb_ribm_solver_3t/dut/clk_i} \
{/tb_ribm_solver_3t/dut/rst_ni} \
{/tb_ribm_solver_3t/dut/start_i} \
{/tb_ribm_solver_3t/dut/syn_valid_i} \
{/tb_ribm_solver_3t/dut/r_cnt\[5:0\]} \
{/tb_ribm_solver_3t/dut/dp0_w\[9:0\]} \
{/tb_ribm_solver_3t/dut/gamma_reg\[9:0\]} \
{/tb_ribm_solver_3t/dut/k_reg\[5:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[0:11\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[0\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[1\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[2\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[3\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[4\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[5\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[6\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[7\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[8\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[9\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[10\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/lam_reg\[11\]\[9:0\]} \
{/tb_ribm_solver_3t/dut/delta_reg\[0:21\]} \
{/tb_ribm_solver_3t/dut/b_reg\[0:11\]} \
{/tb_ribm_solver_3t/dut/theta_reg\[0:21\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_ribm_solver_3t/v_dut\[0:10\]} \
{/tb_ribm_solver_3t/v_ref\[0:10\]} \
{/tb_ribm_solver_3t/sigma_dut\[0:11\]} \
{/tb_ribm_solver_3t/sigma_ref\[0:11\]} \
{/tb_ribm_solver_3t/sigma_ref_q\[0:11\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetPosition -win $_nWave2 {("G2" 5)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvZoom -win $_nWave2 1717627.465857 1756330.804249
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 437748.103187 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 2358 1325
