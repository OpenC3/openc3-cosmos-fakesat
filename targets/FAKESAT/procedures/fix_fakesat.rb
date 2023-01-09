cmd("FAKESAT SLRPNLDEPLOY with NUM 1")
wait_check("FAKESAT MECH SLRPNL1_STATE == 'DEPLOYED'", 5)
cmd("FAKESAT SLRPNLDEPLOY with NUM 2")
wait_check("FAKESAT MECH SLRPNL2_STATE == 'DEPLOYED'", 5)
cmd("FAKESAT ADCS_CTRL with STATE ON")
wait_check("FAKESAT ADCS ADCS_CTRL == 'ON'", 5)

wait_check("FAKESAT MECH BATTERY > 50.0", 240)

cmd("FAKESAT HTR_SETPT with NUM 1, SETPT 30.0")
wait_check_tolerance("FAKESAT THERMAL HEATER1_SETPT", 30.0, 1.0, 5)
cmd("FAKESAT HTR_SETPT with NUM 2, SETPT 30.0")
wait_check_tolerance("FAKESAT THERMAL HEATER2_SETPT", 30.0, 1.0, 5)
cmd("FAKESAT HTR_CTRL with NUM 1, STATE ON")
wait_check("FAKESAT THERMAL HEATER1_CTRL == 'ON'", 5)
cmd("FAKESAT HTR_CTRL with NUM 2, STATE ON")
wait_check("FAKESAT THERMAL HEATER2_CTRL == 'ON'", 5)

cmd("FAKESAT SET_MODE with MODE CHECKOUT")
wait_check("FAKESAT HEALTH_STATUS MODE == 'CHECKOUT'", 5)
cmd("FAKESAT SET_MODE with MODE OPERATE")
wait_check("FAKESAT HEALTH_STATUS MODE == 'OPERATE'", 5)