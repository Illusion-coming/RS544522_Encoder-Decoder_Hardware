verdiSetActWin -dock widgetDock_<Message>
debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult /home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/dump.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 0 0 1718 815
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 10954.976303
wvRestoreSignal -win $_nWave2 \
           "/home/EDA/work/IEEE802_3_CZ/Hardware/Dec_chien/pre_sim/signal_u.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 4 )} 
wvSetCursor -win $_nWave2 64830.173776 -snap {("dut" 1)}
wvSelectSignal -win $_nWave2 {( "dut" 3 )} 
wvSelectSignal -win $_nWave2 {( "dut" 2 )} 
wvSelectSignal -win $_nWave2 {( "dut" 3 )} 
wvSelectSignal -win $_nWave2 {( "dut" 5 )} 
wvSetPosition -win $_nWave2 {("dut" 5)}
wvSetPosition -win $_nWave2 {("dut" 4)}
wvSetPosition -win $_nWave2 {("dut" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("dut" 3)}
wvSetPosition -win $_nWave2 {("dut" 4)}
wvSelectSignal -win $_nWave2 {( "dut" 6 )} 
wvSelectSignal -win $_nWave2 {( "dut" 7 )} 
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {dut/dut_lane_3}
wvSelectGroup -win $_nWave2 {dut/dut_lane_0}
wvSelectGroup -win $_nWave2 {dut/dut_lane_0/dut_lane_0_mul_u1}
wvScrollDown -win $_nWave2 4
wvSelectGroup -win $_nWave2 {dut/dut_lane_0/dut_lane_0_mul_1}
wvScrollDown -win $_nWave2 3
