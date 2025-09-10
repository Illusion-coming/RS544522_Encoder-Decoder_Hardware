verdiSetActWin -dock widgetDock_<Decl._Tree>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult \
           /home/EDA/work/IEEE802_3_CZ/Hardware/Encoder/Matix_Parallel/pre_sim/dump.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "399" "102" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 1718 315
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 1718 818
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/rs_mat_L7_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal7_matix"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_rs544522_lal7_matix/clk} \
{/tb_rs544522_lal7_matix/last_i} \
{/tb_rs544522_lal7_matix/parity_o\[0:21\]} \
{/tb_rs544522_lal7_matix/parity_valid_o} \
{/tb_rs544522_lal7_matix/rst_ni} \
{/tb_rs544522_lal7_matix/s_blk_i\[0:6\]} \
{/tb_rs544522_lal7_matix/start_i} \
{/tb_rs544522_lal7_matix/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_rs544522_lal7_matix/clk} \
{/tb_rs544522_lal7_matix/last_i} \
{/tb_rs544522_lal7_matix/parity_o\[0:21\]} \
{/tb_rs544522_lal7_matix/parity_valid_o} \
{/tb_rs544522_lal7_matix/rst_ni} \
{/tb_rs544522_lal7_matix/s_blk_i\[0:6\]} \
{/tb_rs544522_lal7_matix/start_i} \
{/tb_rs544522_lal7_matix/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetCursor -win $_nWave2 684183.692214 -snap {("G2" 0)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/rs_mat_L7_consts_pkg"
wvGetSignalSetScope -win $_nWave2 "/tb_rs544522_lal7_matix"
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_rs544522_lal7_matix/clk} \
{/tb_rs544522_lal7_matix/rst_ni} \
{/tb_rs544522_lal7_matix/start_i} \
{/tb_rs544522_lal7_matix/valid_i} \
{/tb_rs544522_lal7_matix/s_blk_i\[0:6\]} \
{/tb_rs544522_lal7_matix/last_i} \
{/tb_rs544522_lal7_matix/parity_o\[0:21\]} \
{/tb_rs544522_lal7_matix/parity_valid_o} \
{/tb_rs544522_lal7_matix/chk_en} \
{/tb_rs544522_lal7_matix/chk_rem\[0:21\]} \
{/tb_rs544522_lal7_matix/chk_s\[9:0\]} \
{/tb_rs544522_lal7_matix/chk_start} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_rs544522_lal7_matix/clk} \
{/tb_rs544522_lal7_matix/rst_ni} \
{/tb_rs544522_lal7_matix/start_i} \
{/tb_rs544522_lal7_matix/valid_i} \
{/tb_rs544522_lal7_matix/s_blk_i\[0:6\]} \
{/tb_rs544522_lal7_matix/last_i} \
{/tb_rs544522_lal7_matix/parity_o\[0:21\]} \
{/tb_rs544522_lal7_matix/parity_valid_o} \
{/tb_rs544522_lal7_matix/chk_en} \
{/tb_rs544522_lal7_matix/chk_rem\[0:21\]} \
{/tb_rs544522_lal7_matix/chk_s\[9:0\]} \
{/tb_rs544522_lal7_matix/chk_start} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G1" 12)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvMoveToSubgroup -win $_nWave2 -group "G1-1"
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 )} 
wvMoveToSubgroup -win $_nWave2 -group "G1-1-1"
wvSelectGroup -win $_nWave2 {G1/G1-1/G1-1-1}
wvSetPosition -win $_nWave2 {("G1/G1-1/G1-1-1" 0)}
wvSelectGroup -win $_nWave2 {G1/G1-1/G1-1-1}
wvSelectGroup -win $_nWave2 {G1/G1-1}
wvSetPosition -win $_nWave2 {("G1/G1-1" 0)}
wvSelectGroup -win $_nWave2 {G1/G1-1}
wvSelectGroup -win $_nWave2 {G1/G1-1/G1-1-1}
wvSelectGroup -win $_nWave2 {G1/G1-1/G1-1-1}
wvSetPosition -win $_nWave2 {("G1/G1-1/G1-1-1" 0)}
wvSetPosition -win $_nWave2 {("G1/G1-1" 8)}
wvSetPosition -win $_nWave2 {("G1/G1-1" 6)}
wvSetPosition -win $_nWave2 {("G1/G1-1" 5)}
wvSetPosition -win $_nWave2 {("G1/G1-1" 4)}
wvSetPosition -win $_nWave2 {("G1/G1-1" 3)}
wvSetPosition -win $_nWave2 {("G1/G1-1" 2)}
wvSetPosition -win $_nWave2 {("G1/G1-1" 1)}
wvSetPosition -win $_nWave2 {("G1/G1-1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G1/G1-1-1}
wvSelectGroup -win $_nWave2 {G1/G1-1-1}
wvSelectGroup -win $_nWave2 {G1/G1-1}
wvRenameGroup -win $_nWave2 {G1/G1-1} {dut}
wvSelectGroup -win $_nWave2 {G1/G1-1-1}
wvRenameGroup -win $_nWave2 {G1/G1-1-1} {check}
wvZoom -win $_nWave2 687621.801220 948918.085684
wvSelectSignal -win $_nWave2 {( "G1/dut" 8 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 6178616.567143 6585591.311086
wvSelectSignal -win $_nWave2 {( "G1/check" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1/check" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1/check" 4 )} 
wvSetCursor -win $_nWave2 6300468.887231 -snap {("dut" 8)}
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Encoder/Matix_Parallel/pre_sim/signal.rc"
wvSetCursor -win $_nWave2 7137271.031225 -snap {("G2" 0)}
