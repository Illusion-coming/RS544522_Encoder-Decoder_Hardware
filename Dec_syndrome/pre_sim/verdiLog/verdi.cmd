verdiSetActWin -dock widgetDock_<Decl._Tree>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult \
           /home/EDA/work/IEEE802_3_CZ/Hardware/Dec_syndrome/pre_sim/dump.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiSetActWin -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 1718 317
wvResizeWindow -win $_nWave2 -10 20 1718 818
wvSetCursor -win $_nWave2 31556528362.831860
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_syndrome/pre_sim/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvResizeWindow -win $_nWave2 -10 20 1718 818
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 210453.492063 224556.853408
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetCursor -win $_nWave2 124677.401439 -snap {("dut" 4)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 260519.503048 -snap {("ref" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
verdiSetActWin -dock widgetDock_<Message>
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 104774.147965 -snap {("G3" 0)}
wvSelectGroup -win $_nWave2 {dut}
wvSelectGroup -win $_nWave2 {dut} {G3}
wvSelectGroup -win $_nWave2 {dut} {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetCursor -win $_nWave2 157515.188664
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_syndrome/pre_sim/signal_neg.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSetCursor -win $_nWave2 256917.385621 -snap {("ref" 3)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 49960.784314 -snap {("dut" 4)}
wvSetCursor -win $_nWave2 54457.254902 -snap {("dut" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 44631.633987 57954.509804
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 215005.092400 -snap {("dut" 8)}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("ref" 7)}
wvSetPosition -win $_nWave2 {("ref" 6)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 5499000.000000 -snap {("ref" 8)}
wvZoom -win $_nWave2 5347333.333333 5516333.333333
wvSetCursor -win $_nWave2 5489823.529411 -snap {("ref" 7)}
wvSelectSignal -win $_nWave2 {( "ref" 6 )} 
wvSelectSignal -win $_nWave2 {( "ref" 7 )} 
wvSelectSignal -win $_nWave2 {( "ref" 8 )} 
wvSetCursor -win $_nWave2 5413210.196078 -snap {("G3" 0)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 4590794.509804 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 169000.000000 390000.000000
wvSetCursor -win $_nWave2 215106.666667 -snap {("dut" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 21666.666667 329333.333333
wvSetCursor -win $_nWave2 54967.058824 -snap {("dut" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge"
wvSetCursor -win $_nWave2 179049.934641 -snap {("ref" 7)}
wvSetCursor -win $_nWave2 360150.980392 -snap {("ref" 7)}
wvSetCursor -win $_nWave2 369561.960784 -snap {("ref" 7)}
wvSetCursor -win $_nWave2 208610.065359 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
verdiSetActWin -dock widgetDock_<Message>
verdiSetActWin -win $_nWave2
verdiSetActWin -dock widgetDock_<Message>
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 215366.666667 -snap {("dut" 1)}
wvSetCursor -win $_nWave2 225984.183007 -snap {("dut" 1)}
wvSetCursor -win $_nWave2 214884.052288 -snap {("dut" 1)}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvSetCursor -win $_nWave2 214884.052288 -snap {("dut" 7)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "ref" 7 )} 
wvSetPosition -win $_nWave2 {("ref" 7)}
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "ref" 7 )} 
wvSetPosition -win $_nWave2 {("ref" 7)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("ref" 7)}
wvSelectSignal -win $_nWave2 {( "ref" 8 )} 
wvSetPosition -win $_nWave2 {("ref" 8)}
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "ref" 8 )} 
wvSetPosition -win $_nWave2 {("ref" 8)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("ref" 8)}
wvSetCursor -win $_nWave2 89042.352941 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 7 )} 
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 6 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 6)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("ref" 8)}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 6 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 6)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/lane1" 6)}
wvSetPosition -win $_nWave2 {("ref" 8)}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 6 )} 
wvSelectSignal -win $_nWave2 {( "dut/lane1" 7 )} 
wvSelectSignal -win $_nWave2 {( "dut/lane1" 8 )} 
wvSelectSignal -win $_nWave2 {( "dut/lane1" 8 )} 
wvSelectSignal -win $_nWave2 {( "dut/lane1" 9 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut/lane1" 6 )} 
wvSelectSignal -win $_nWave2 {( "dut/lane1" 6 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 6)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("ref" 8)}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 6 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 6)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/lane1" 6)}
wvSetPosition -win $_nWave2 {("ref" 8)}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 9 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 9)}
wvSetPosition -win $_nWave2 {("dut/lane1" 8)}
wvSetPosition -win $_nWave2 {("dut/lane1" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/lane1" 9)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul"
wvSetPosition -win $_nWave2 {("dut/lane1" 12)}
wvSetPosition -win $_nWave2 {("dut/lane1" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 10 11 12 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 12)}
wvSetPosition -win $_nWave2 {("dut/lane1" 12)}
wvSetPosition -win $_nWave2 {("dut/lane1" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 10 11 12 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 12)}
wvGetSignalClose -win $_nWave2
wvMoveToSubgroup -win $_nWave2 -group "lane1-1"
wvSelectGroup -win $_nWave2 {dut/lane1/lane1-1}
wvRenameGroup -win $_nWave2 {dut/lane1/lane1-1} {lane1_mul1}
wvZoom -win $_nWave2 37643.921569 75287.843137
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 49955.698270 -snap {("lane1_mul1" 1)}
wvSelectSignal -win $_nWave2 {( "dut/lane1/lane1_mul1" 2 )} 
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSetPosition -win $_nWave2 {("dut/lane1" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvSelectSignal -win $_nWave2 {( "dut" 8 )} 
wvSetPosition -win $_nWave2 {("dut" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge/u_dut"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]"
wvGetSignalClose -win $_nWave2
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetPosition -win $_nWave2 {("dut" 4)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 40)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetPosition -win $_nWave2 {("dut" 4)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 4)}
wvSetPosition -win $_nWave2 {("dut" 8)}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectSignal -win $_nWave2 {( "ref" 7 )} 
wvSetPosition -win $_nWave2 {("ref" 7)}
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "ref" 7 )} 
wvSetPosition -win $_nWave2 {("ref" 7)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("ref" 7)}
wvSelectSignal -win $_nWave2 {( "ref" 8 )} 
wvSelectSignal -win $_nWave2 {( "ref" 8 )} 
wvSetPosition -win $_nWave2 {("ref" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("ref" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge/u_dut"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge/u_ref"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul"
wvSetPosition -win $_nWave2 {("ref" 11)}
wvSetPosition -win $_nWave2 {("ref" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1/lane1_mul1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "ref" 9 10 11 )} 
wvSetPosition -win $_nWave2 {("ref" 11)}
wvSetPosition -win $_nWave2 {("ref" 11)}
wvSetPosition -win $_nWave2 {("ref" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1/lane1_mul1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "ref" 9 10 11 )} 
wvSetPosition -win $_nWave2 {("ref" 11)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge/u_ref"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul"
wvGetSignalClose -win $_nWave2
wvMoveToSubgroup -win $_nWave2 -group "ref-1"
wvSelectGroup -win $_nWave2 {ref/ref-1}
wvRenameGroup -win $_nWave2 {ref/ref-1} {ref_glane0}
wvSelectSignal -win $_nWave2 {( "ref" 8 )} 
wvSelectGroup -win $_nWave2 {ref/ref_glane0}
wvSetPosition -win $_nWave2 {("ref/ref_glane0" 0)}
wvSetCursor -win $_nWave2 118570.971780 -snap {("ref" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 5442666.666667 5516333.333333
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 56333.333333
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 49661.699346 -snap {("lane1_mul1" 1)}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {ref/ref_glane0}
wvSetCursor -win $_nWave2 114875.816993 -snap {("ref_glane0" 2)}
wvSetCursor -win $_nWave2 54433.464052 -snap {("ref_glane0" 3)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 141032.156863 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 5468666.666667 5512000.000000
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 5485235.294117 -snap {("ref_glane0" 3)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 5399333.333333 5516333.333333
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 34666.666667 290333.333333
wvSelectGroup -win $_nWave2 {ref}
wvSetPosition -win $_nWave2 {("ref" 0)}
wvSelectGroup -win $_nWave2 {dut/lane1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 8 )} 
wvSelectSignal -win $_nWave2 {( "dut/lane1" 9 )} 
wvSelectSignal -win $_nWave2 {( "dut/lane1" 9 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/lane1" 9)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge/u_ref"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul"
wvSetPosition -win $_nWave2 {("dut/lane1" 10)}
wvSetPosition -win $_nWave2 {("dut/lane1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul/A\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1/lane1_mul1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "dut/lane1/lane1_mul1"
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref/ref_glane0" \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "ref"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 10 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 10)}
wvSetPosition -win $_nWave2 {("dut/lane1" 10)}
wvSetPosition -win $_nWave2 {("dut/lane1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul/A\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1/lane1_mul1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "dut/lane1/lane1_mul1"
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref/ref_glane0" \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "ref"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 10 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 10)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge/u_dut"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul"
wvSetPosition -win $_nWave2 {("dut/lane1" 11)}
wvSetPosition -win $_nWave2 {("dut/lane1" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul/B\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1/lane1_mul1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "dut/lane1/lane1_mul1"
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref/ref_glane0" \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "ref"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 11 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 11)}
wvSetPosition -win $_nWave2 {("dut/lane1" 11)}
wvSetPosition -win $_nWave2 {("dut/lane1" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul/B\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1/lane1_mul1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "dut/lane1/lane1_mul1"
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref/ref_glane0" \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "ref"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 11 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 11)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut/lane1" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/lane1/lane1_mul1" 0)}
wvSetPosition -win $_nWave2 {("dut/lane1" 10)}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 10 )} 
wvRenameSignal -win $_nWave2 \
           {/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane[1]/u_lane/u_mul_fb/u_mul/B[9:0]} \
           {B[9:0](FEED_C)}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 9 )} 
wvSetCursor -win $_nWave2 54919.477124 -snap {("lane1" 9)}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectSignal -win $_nWave2 {( "dut/lane1/lane1_mul1" 1 )} 
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvRenameGroup -win $_nWave2 {dut/lane1/lane1_mul1} {lane1_mul10}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul10}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul10}
wvRenameGroup -win $_nWave2 {dut/lane1/lane1_mul10} {lane1_mul1}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 10 )} 
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut/lane1" 10)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge"
wvGetSignalSetScope -win $_nWave2 "/tb_syndrome_lal32_ref_math_negedge/u_dut"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[2\]/u_mul_const"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[2\]/u_mul_const/u_mul"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[2\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]/u_mul_const"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]/u_mul_const/u_mul"
wvSetPosition -win $_nWave2 {("dut/lane1" 13)}
wvSetPosition -win $_nWave2 {("dut/lane1" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul/B\[9:0\]\(FEED_C\)} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1/lane1_mul1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref/ref_glane0" \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "ref"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 11 12 13 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 13)}
wvSetPosition -win $_nWave2 {("dut/lane1" 13)}
wvSetPosition -win $_nWave2 {("dut/lane1" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"dut" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_dut\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_dut} \
{/tb_syndrome_lal32_ref_math_negedge/s_dut\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/clk_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/rst_ni} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/start_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/valid_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/last_i} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/data_i\[31:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_n\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_valid_o} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/s_o\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/u_mul_fb/u_mul/B\[9:0\]\(FEED_C\)} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[31\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"dut/lane1/lane1_mul1" \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_dut/g_lane\[1\]/u_lane/g_mul\[1\]/u_mul_const/u_mul/P\[9:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref" \
{/tb_syndrome_lal32_ref_math_negedge/clk} \
{/tb_syndrome_lal32_ref_math_negedge/rst_n} \
{/tb_syndrome_lal32_ref_math_negedge/start_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/valid_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/s_valid_ref} \
{/tb_syndrome_lal32_ref_math_negedge/last_i_ref} \
{/tb_syndrome_lal32_ref_math_negedge/data_i_ref\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/s_ref\[21:0\]} \
}
wvAddSignal -win $_nWave2 -group {"ref/ref_glane0" \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/A\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/B\[9:0\]} \
{/tb_syndrome_lal32_ref_math_negedge/u_ref/g_lane\[0\]/u_mul_ax/u_mul/P\[9:0\]} \
}
wvCollapseGroup -win $_nWave2 "ref"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "dut/lane1" 11 12 13 )} 
wvSetPosition -win $_nWave2 {("dut/lane1" 13)}
wvGetSignalClose -win $_nWave2
wvMoveToSubgroup -win $_nWave2 -group "lane1-2"
wvSelectGroup -win $_nWave2 {dut/lane1/lane1-2}
wvRenameGroup -win $_nWave2 {dut/lane1/lane1-2} {lane1-mul31}
wvSetCursor -win $_nWave2 121292.549020 -snap {("G3" 0)}
wvSaveSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_syndrome/pre_sim/signal_neg.rc"
wvSelectGroup -win $_nWave2 {dut/lane1/lane1-mul31}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1-mul31}
wvSetPosition -win $_nWave2 {("dut/lane1/lane1-mul31" 0)}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvExpandGroup -win $_nWave2 "ref"
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvCollapseGroup -win $_nWave2 "ref"
wvCollapseGroup -win $_nWave2 "ref"
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvExpandGroup -win $_nWave2 "ref"
wvSelectGroup -win $_nWave2 {dut/lane1/lane1_mul1}
wvSelectGroup -win $_nWave2 {ref/ref_glane0}
wvSetCursor -win $_nWave2 186663.006536 -snap {("lane1" 8)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 198918.692810 -snap {("lane1_mul1" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 5481666.666667 5516333.333333
wvSetCursor -win $_nWave2 5491808.366012 -snap {("lane1_mul1" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
