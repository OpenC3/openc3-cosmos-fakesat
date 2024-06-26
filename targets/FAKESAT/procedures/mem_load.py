# Note hex 0x20 is ASCII space ' ' character
data = "\x20" * 10
cmd(f"FAKESAT TABLE_LOAD with DATA {data}")
cmd("FAKESAT", "TABLE_LOAD", {"DATA": data})
wait(2)  # Allow telemetry to change
# Can't use check for binary data so we grab the data
# and check simply using comparison
block = tlm("FAKESAT HEALTH_STATUS TABLE_DATA")
if data != block:
    raise RuntimeError("TABLE_DATA not updated correctly!")
