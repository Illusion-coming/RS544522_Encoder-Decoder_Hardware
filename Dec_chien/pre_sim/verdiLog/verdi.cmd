verdiSetActWin -dock widgetDock_<Decl._Tree>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult /home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/dump.fsdb
wvCreateWindow
wvSetCursor -win $_nWave2 44888586913.716820
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 1718 313
wvResizeWindow -win $_nWave2 -10 20 1718 815
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 1 )} 
wvSelectGroup -win $_nWave2 {dut/dut_lane_0}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 1)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/para_M\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 1 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 1)}
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut/g_lane\[0\]/u_lane"
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 2)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/para_M\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/para_M\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 2 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 2)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 2)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/para_M\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/para_M\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 2 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 2)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 2 )} 
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 2)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 1)}
wvSetCursor -win $_nWave2 55654.339150 -snap {("dut_lane_0" 3)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut/g_lane\[0\]/u_lane"
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 70352.846324 -snap {("dut_lane_0" 0)}
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 67667.542129 -snap {("dut" 6)}
wvSetCursor -win $_nWave2 69363.523726 -snap {("dut_lane_0" 7)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 55967.392701 -snap {("dut" 8)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 1)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 0)}
wvZoom -win $_nWave2 43530.194323 139635.818153
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 64829.544037 -snap {("dut_lane_0" 7)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 9 )} 
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 8 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 8)}
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 8 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 8)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 8)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 8 )} 
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 8 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 8)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 8)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 9 )} 
wvSetCursor -win $_nWave2 74698.209991 -snap {("dut_lane_0" 9)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 9 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 9)}
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 9 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 9)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 9)}
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 9 )} 
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 9 )} 
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 9 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 9)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 9)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 10 )} 
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 6 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 6)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 20)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 6 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 6)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 6)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 9)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 7 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 7)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 20)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 7 )} 
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 7)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 7)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 9)}
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 9 )} 
wvSelectSignal -win $_nWave2 {( "dut/dut_lane_0" 10 )} 
wvSetCursor -win $_nWave2 75609.163772 -snap {("dut_lane_0" 10)}
wvSetCursor -win $_nWave2 64070.415887 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 75305.512512 -snap {("G3" 3)}
wvSetCursor -win $_nWave2 74090.907471 -snap {("G3" 4)}
wvSelectGroup -win $_nWave2 {G3}
wvRenameGroup -win $_nWave2 {G3} {dut_lane_2}
wvSetCursor -win $_nWave2 245350.218183 -snap {("dut" 7)}
wvSelectSignal -win $_nWave2 {( "dut" 9 )} 
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSelectGroup -win $_nWave2 {dut_lane_2}
wvSelectGroup -win $_nWave2 {dut/dut_lane_0}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 0)}
wvSelectGroup -win $_nWave2 {dut_lane_2}
wvSetPosition -win $_nWave2 {("dut_lane_2" 0)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 0)}
wvSetPosition -win $_nWave2 {("dut" 10)}
wvSetPosition -win $_nWave2 {("dut" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 9)}
wvSelectGroup -win $_nWave2 {dut/dut_lane_2}
wvSelectGroup -win $_nWave2 {dut/dut_lane_0}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 0)}
wvSetPosition -win $_nWave2 {("dut" 15)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_2" 0)}
wvSetPosition -win $_nWave2 {("dut" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 9)}
wvSelectSignal -win $_nWave2 {( "dut" 30 )} 
wvSetPosition -win $_nWave2 {("dut" 30)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_2" 0)}
wvSetPosition -win $_nWave2 {("dut/dut_lane_0" 0)}
wvSetPosition -win $_nWave2 {("dut" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 9)}
wvSetPosition -win $_nWave2 {("dut" 10)}
wvSelectGroup -win $_nWave2 {dut/dut_lane_2}
wvSelectGroup -win $_nWave2 {dut/dut_lane_0}
wvSelectGroup -win $_nWave2 {dut/dut_lane_2}
wvRenameGroup -win $_nWave2 {dut/dut_lane_2} {dut_lane_1}
wvSelectGroup -win $_nWave2 {G4}
wvSelectGroup -win $_nWave2 {G4}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetCursor -win $_nWave2 55568.180603 -snap {("dut" 8)}
wvSetCursor -win $_nWave2 225309.235014 -snap {("dut" 8)}
wvZoom -win $_nWave2 220147.163592 252030.545906
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSetPosition -win $_nWave2 {("dut" 8)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 15 )} 
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSelectSignal -win $_nWave2 {( "dut" 15 )} 
wvSetCursor -win $_nWave2 244928.560272 -snap {("dut" 16)}
wvSelectSignal -win $_nWave2 {( "dut" 16 )} 
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSetPosition -win $_nWave2 {("dut" 8)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 8)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 10 )} 
wvSetPosition -win $_nWave2 {("dut" 10)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 35 )} 
wvScrollUp -win $_nWave2 6
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSetPosition -win $_nWave2 {("dut" 8)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetCursor -win $_nWave2 225058.111105 -snap {("dut" 8)}
wvSelectSignal -win $_nWave2 {( "dut" 37 )} 
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSetPosition -win $_nWave2 {("dut" 8)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 8)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSetPosition -win $_nWave2 {("dut" 8)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSetPosition -win $_nWave2 {("dut" 8)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 8)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "dut" 14 )} 
wvSelectSignal -win $_nWave2 {( "dut" 10 )} 
wvSelectSignal -win $_nWave2 {( "dut" 10 )} 
wvSelectSignal -win $_nWave2 {( "dut" 10 )} 
wvSetPosition -win $_nWave2 {("dut" 10)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 10)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 10 )} 
wvSelectSignal -win $_nWave2 {( "dut" 10 )} 
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 10 )} 
wvSetPosition -win $_nWave2 {("dut" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 10)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut"
wvSetPosition -win $_nWave2 {("dut" 11)}
wvSetPosition -win $_nWave2 {("dut" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/batch_cnt_q\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut" 11 )} 
wvSetPosition -win $_nWave2 {("dut" 11)}
wvSetPosition -win $_nWave2 {("dut" 11)}
wvSetPosition -win $_nWave2 {("dut" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/batch_cnt_q\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut" 11 )} 
wvSetPosition -win $_nWave2 {("dut" 11)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 66083.724479 -snap {("dut" 6)}
wvSetCursor -win $_nWave2 74948.614348 -snap {("dut" 1)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut/g_lane\[0\]"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut"
wvSetPosition -win $_nWave2 {("dut" 12)}
wvSetPosition -win $_nWave2 {("dut" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/batch_cnt_q\[4:0\]} \
{/tb_chien_search/dut/state_q\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut" 12 )} 
wvSetPosition -win $_nWave2 {("dut" 12)}
wvSetPosition -win $_nWave2 {("dut" 12)}
wvSetPosition -win $_nWave2 {("dut" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/batch_cnt_q\[4:0\]} \
{/tb_chien_search/dut/state_q\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut" 12 )} 
wvSetPosition -win $_nWave2 {("dut" 12)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 64471.926321 -snap {("dut" 12)}
wvZoom -win $_nWave2 60442.430926 77366.311585
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 74432.991715 -snap {("dut" 12)}
wvSetCursor -win $_nWave2 235062.810041 -snap {("dut" 11)}
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/signal.rc"
wvSetCursor -win $_nWave2 84699.611261 -snap {("dut" 11)}
wvSetCursor -win $_nWave2 75074.655436 -snap {("dut" 10)}
wvSetCursor -win $_nWave2 65021.923797 -snap {("dut" 12)}
wvSetCursor -win $_nWave2 85769.050797 -snap {("dut" 11)}
wvSetCursor -win $_nWave2 75288.543343 -snap {("dut" 12)}
wvSetCursor -win $_nWave2 84913.499169 -snap {("dut" 11)}
wvSetCursor -win $_nWave2 233565.594690 -snap {("dut" 10)}
wvSelectGroup -win $_nWave2 {G4}
wvSetCursor -win $_nWave2 54541.416343 -snap {("dut" 8)}
wvSetCursor -win $_nWave2 64808.035889 -snap {("dut" 5)}
wvSetCursor -win $_nWave2 75716.319158 -snap {("dut" 11)}
wvSetCursor -win $_nWave2 75074.655436 -snap {("dut" 12)}
wvSetCursor -win $_nWave2 54327.528435 -snap {("dut" 5)}
wvSetCursor -win $_nWave2 64594.147982 -snap {("dut" 6)}
wvSetCursor -win $_nWave2 54755.304250 -snap {("dut" 8)}
wvSetCursor -win $_nWave2 65449.699611 -snap {("dut" 6)}
wvSetCursor -win $_nWave2 54969.192157 -snap {("dut" 5)}
wvSetCursor -win $_nWave2 63952.484260 -snap {("dut" 12)}
wvSetCursor -win $_nWave2 54969.192157 -snap {("dut" 5)}
wvSelectSignal -win $_nWave2 {( "dut" 12 )} 
wvSelectSignal -win $_nWave2 {( "dut" 7 )} 
wvSelectSignal -win $_nWave2 {( "dut" 7 )} 
wvSelectSignal -win $_nWave2 {( "dut" 6 )} 
wvSelectSignal -win $_nWave2 {( "dut" 7 )} 
wvSetCursor -win $_nWave2 65235.811704 -snap {("dut" 12)}
wvSetCursor -win $_nWave2 55183.080064 -snap {("dut" 5)}
wvSetCursor -win $_nWave2 61385.829374 -snap {("dut" 5)}
wvSetCursor -win $_nWave2 75074.655436 -snap {("dut" 12)}
wvSetCursor -win $_nWave2 54327.528435 -snap {("dut" 5)}
wvSetCursor -win $_nWave2 64808.035889 -snap {("dut" 5)}
wvSetCursor -win $_nWave2 74219.103807 -snap {("dut_lane_0" 10)}
wvSetCursor -win $_nWave2 53899.752621 -snap {("dut" 5)}
wvSetCursor -win $_nWave2 65021.923797 -snap {("dut" 6)}
wvSetCursor -win $_nWave2 55824.743786 -snap {("dut" 5)}
wvSelectSignal -win $_nWave2 {( "dut" 12 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut/g_lane\[0\]"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 "/tb_chien_search/dut"
wvSetPosition -win $_nWave2 {("dut" 13)}
wvSetPosition -win $_nWave2 {("dut" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/batch_cnt_q\[4:0\]} \
{/tb_chien_search/dut/state_q\[1:0\]} \
{/tb_chien_search/dut/lam_reg\[0:11\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut" 13 )} 
wvSetPosition -win $_nWave2 {("dut" 13)}
wvSetPosition -win $_nWave2 {("dut" 13)}
wvSetPosition -win $_nWave2 {("dut" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/batch_cnt_q\[4:0\]} \
{/tb_chien_search/dut/state_q\[1:0\]} \
{/tb_chien_search/dut/lam_reg\[0:11\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "dut" 13 )} 
wvSetPosition -win $_nWave2 {("dut" 13)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 65877.475425 -snap {("dut" 1)}
wvSetCursor -win $_nWave2 55396.967971 -snap {("dut" 3)}
wvSelectSignal -win $_nWave2 {( "dut" 13 )} 
wvSelectSignal -win $_nWave2 {( "dut" 13 )} 
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/signal.rc"
wvSetCursor -win $_nWave2 234848.922134 -snap {("dut" 11)}
wvSetCursor -win $_nWave2 226293.405845 -snap {("dut" 11)}
wvSetCursor -win $_nWave2 234207.258412 -snap {("dut" 11)}
wvSetCursor -win $_nWave2 224796.190494 -snap {("dut" 11)}
wvSetCursor -win $_nWave2 245115.541681 -snap {("dut" 12)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvCreateWindow
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 -10 20 1718 815
wvSetCursor -win $_nWave3 1836466.814159
wvRestoreSignal -win $_nWave3 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvResizeWindow -win $_nWave3 -10 20 1718 815
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 64354.069719 -snap {("dut" 1)}
wvZoom -win $_nWave3 57159.204781 72348.364094
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSelectSignal -win $_nWave3 {( "dut" 11 )} 
wvSelectSignal -win $_nWave3 {( "dut" 10 )} 
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoom -win $_nWave3 49910.665672 92142.767394
wvZoomOut -win $_nWave3
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "dut" 11 )} 
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 74990.335443 -snap {("dut" 1)}
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvSetCursor -win $_nWave3 63781.815555 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 73922.857359 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 60045.642259 -snap {("dut" 3)}
wvSetCursor -win $_nWave3 65649.902203 -snap {("dut" 1)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 75790.944007 -snap {("dut" 1)}
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvSetCursor -win $_nWave3 64849.293640 -snap {("dut" 12)}
wvSetCursor -win $_nWave3 73389.118316 -snap {("dut" 1)}
wvSelectSignal -win $_nWave3 {( "dut" 10 )} 
wvSelectSignal -win $_nWave3 {( "dut" 8 )} 
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/dut"
wvSetPosition -win $_nWave3 {("dut" 16)}
wvSetPosition -win $_nWave3 {("dut" 16)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/batch_cnt\[4:0\]} \
{/tb_chien_search/dut/state\[1:0\]} \
{/tb_chien_search/dut/lam_reg\[0:11\]} \
{/tb_chien_search/dut/hit_mask\[31:0\]} \
{/tb_chien_search/dut/idx_cw\[0:31\]} \
{/tb_chien_search/dut/idx_lane\[0:31\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G4" \
}
wvSelectSignal -win $_nWave3 {( "dut" 14 15 16 )} 
wvSetPosition -win $_nWave3 {("dut" 16)}
wvSetPosition -win $_nWave3 {("dut" 16)}
wvSetPosition -win $_nWave3 {("dut" 16)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/batch_cnt\[4:0\]} \
{/tb_chien_search/dut/state\[1:0\]} \
{/tb_chien_search/dut/lam_reg\[0:11\]} \
{/tb_chien_search/dut/hit_mask\[31:0\]} \
{/tb_chien_search/dut/idx_cw\[0:31\]} \
{/tb_chien_search/dut/idx_lane\[0:31\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G4" \
}
wvSelectSignal -win $_nWave3 {( "dut" 14 15 16 )} 
wvSetPosition -win $_nWave3 {("dut" 16)}
wvGetSignalClose -win $_nWave3
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "dut" 15 )} 
wvSelectSignal -win $_nWave3 {( "dut" 16 )} 
wvSetCursor -win $_nWave3 84597.638205 -snap {("dut" 15)}
wvSetCursor -win $_nWave3 74990.335443 -snap {("dut" 14)}
wvSelectSignal -win $_nWave3 {( "dut" 10 )} 
wvSetPosition -win $_nWave3 {("dut" 10)}
wvSetPosition -win $_nWave3 {("dut" 11)}
wvSetPosition -win $_nWave3 {("dut" 12)}
wvSetPosition -win $_nWave3 {("dut" 13)}
wvSetPosition -win $_nWave3 {("dut" 14)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("dut" 14)}
wvSelectSignal -win $_nWave3 {( "dut" 6 )} 
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvSelectSignal -win $_nWave3 {( "dut" 7 )} 
wvSelectSignal -win $_nWave3 {( "dut" 7 )} 
wvSelectSignal -win $_nWave3 {( "dut" 6 )} 
wvSetCursor -win $_nWave3 65116.163161 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 74723.465922 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 64048.685076 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 74990.335443 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 65916.771724 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 75790.944007 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 234044.570049 -snap {("dut" 1)}
wvSetCursor -win $_nWave3 244452.481374 -snap {("dut" 1)}
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvSelectSignal -win $_nWave3 {( "dut" 8 )} 
wvSelectSignal -win $_nWave3 {( "dut" 3 )} 
wvSetCursor -win $_nWave3 65383.032682 -snap {("dut" 6)}
wvSetCursor -win $_nWave3 74723.465922 -snap {("dut" 8)}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/dut"
wvSetPosition -win $_nWave3 {("dut" 15)}
wvSetPosition -win $_nWave3 {("dut" 15)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/batch_cnt\[4:0\]} \
{/tb_chien_search/dut/state\[1:0\]} \
{/tb_chien_search/dut/lam_reg\[0:11\]} \
{/tb_chien_search/dut/hit_mask\[31:0\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/step_lane} \
{/tb_chien_search/dut/idx_cw\[0:31\]} \
{/tb_chien_search/dut/idx_lane\[0:31\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G4" \
}
wvSelectSignal -win $_nWave3 {( "dut" 15 )} 
wvSetPosition -win $_nWave3 {("dut" 15)}
wvSetPosition -win $_nWave3 {("dut" 15)}
wvSetPosition -win $_nWave3 {("dut" 15)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"dut" \
{/tb_chien_search/clk} \
{/tb_chien_search/rstn} \
{/tb_chien_search/start_i} \
{/tb_chien_search/sigma_low_i\[0:11\]} \
{/tb_chien_search/sigma_valid_i} \
{/tb_chien_search/busy_o} \
{/tb_chien_search/done_o} \
{/tb_chien_search/hit_mask_o\[31:0\]} \
{/tb_chien_search/pos_bus_o\[0:31\]} \
{/tb_chien_search/dut/batch_cnt\[4:0\]} \
{/tb_chien_search/dut/state\[1:0\]} \
{/tb_chien_search/dut/lam_reg\[0:11\]} \
{/tb_chien_search/dut/hit_mask\[31:0\]} \
{/tb_chien_search/dut/sum_bus\[0:31\]} \
{/tb_chien_search/dut/step_lane} \
{/tb_chien_search/dut/idx_cw\[0:31\]} \
{/tb_chien_search/dut/idx_lane\[0:31\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_0" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/clk_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/rst_ni} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/lam_low_i\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/load_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/step_i} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/Tj\[0:11\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_0/dut_lane_0_mul_1" \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/a_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/b_i\[9:0\]} \
{/tb_chien_search/dut/g_lane\[0\]/u_lane/g_mul\[1\]/u_mul/p_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"dut/dut_lane_1" \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_a\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_b\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/mul_p\[1:11\]} \
{/tb_chien_search/dut/g_lane\[1\]/u_lane/sum_o\[9:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G4" \
}
wvSelectSignal -win $_nWave3 {( "dut" 15 )} 
wvSetPosition -win $_nWave3 {("dut" 15)}
wvGetSignalClose -win $_nWave3
wvSetCursor -win $_nWave3 243918.742332 -snap {("dut" 15)}
wvSetCursor -win $_nWave3 75257.204965 -snap {("dut" 15)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvSetCursor -win $_nWave3 224971.006330 -snap {("dut" 8)}
wvSetCursor -win $_nWave3 244719.350895 -snap {("dut" 8)}
wvSetCursor -win $_nWave3 254059.784136 -snap {("dut" 7)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoom -win $_nWave3 198550.923736 339458.030904
wvZoomOut -win $_nWave3
wvSelectSignal -win $_nWave3 {( "dut" 17 )} 
wvScrollDown -win $_nWave3 5
wvSelectGroup -win $_nWave3 {G4}
wvSetPosition -win $_nWave3 {("G4" 0)}
wvMoveSelected -win $_nWave3
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search"
wvGetSignalClose -win $_nWave3
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/chien_consts_pkg"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/dut"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/dut/g_lane\[0\]"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/dut/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/MAIN"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/WATCHDOG"
wvGetSignalSetScope -win $_nWave3 "/tb_chien_search/dut"
wvGetSignalClose -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvZoomOut -win $_nWave3
wvSelectSignal -win $_nWave3 {( "dut" 9 )} 
wvSetPosition -win $_nWave3 {("dut" 9)}
wvExpandBus -win $_nWave3
wvSetPosition -win $_nWave3 {("G4" 0)}
wvSelectSignal -win $_nWave3 {( "dut" 13 )} 
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "dut" 8 )} 
wvSetPosition -win $_nWave3 {("dut" 8)}
wvExpandBus -win $_nWave3
wvSetPosition -win $_nWave3 {("G4" 0)}
wvSelectSignal -win $_nWave3 {( "dut" 16 )} 
wvSetCursor -win $_nWave3 225273.289817 -snap {("dut" 37)}
wvSelectSignal -win $_nWave3 {( "dut" 37 )} 
wvSelectSignal -win $_nWave3 {( "dut" 8 )} 
wvSetPosition -win $_nWave3 {("dut" 8)}
wvCollapseBus -win $_nWave3
wvSetPosition -win $_nWave3 {("dut" 8)}
wvSetPosition -win $_nWave3 {("G4" 0)}
wvSelectSignal -win $_nWave3 {( "dut" 13 )} 
wvScrollDown -win $_nWave3 6
wvScrollUp -win $_nWave3 7
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "dut" 9 )} 
wvSetPosition -win $_nWave3 {("dut" 9)}
wvCollapseBus -win $_nWave3
wvSetPosition -win $_nWave3 {("dut" 9)}
wvSetPosition -win $_nWave3 {("G4" 0)}
wvZoomOut -win $_nWave3
wvZoom -win $_nWave3 214588.390695 260889.620223
wvZoomOut -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvSaveSignal -win $_nWave3 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/signal.rc"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
