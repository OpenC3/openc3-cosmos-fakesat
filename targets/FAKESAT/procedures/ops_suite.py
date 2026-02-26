# Copyright 2026 OpenC3, Inc.
# All Rights Reserved.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See LICENSE.md for more details.

from openc3.script.suite import Suite, Group

load_utility("FAKESAT/lib/fake_sat.py")


class CollectGroup(Group):
    def script_normal_collect(self):
        print(
            f"Running {Group.current_suite()}:{Group.current_group()}:{Group.current_script()}"
        )
        Group.print("Perform Normal Collect")

        cmd_cnt = tlm("FAKESAT HEALTH_STATUS CMD_ACPT_CNT")
        collect_cnt = tlm("FAKESAT IMAGER COLLECTS")
        cmd("FAKESAT COLLECT with TYPE NORMAL, DURATION 5")
        wait_check(f"FAKESAT HEALTH_STATUS CMD_ACPT_CNT == {cmd_cnt + 1}", 5)
        wait_check(f"FAKESAT IMAGER COLLECTS == {collect_cnt + 1}", 5)
        wait_check("FAKESAT IMAGER COLLECT_TYPE == 'NORMAL'", 5)

    def script_special_collect(self):
        print(
            f"Running {Group.current_suite()}:{Group.current_group()}:{Group.current_script()}"
        )
        Group.print("Perform Special Collect")

        cmd_cnt = tlm("FAKESAT HEALTH_STATUS CMD_ACPT_CNT")
        collect_cnt = tlm("FAKESAT IMAGER COLLECTS")
        cmd("FAKESAT COLLECT with TYPE SPECIAL, DURATION 5")
        wait_check(f"FAKESAT HEALTH_STATUS CMD_ACPT_CNT == {cmd_cnt + 1}", 5)
        wait_check(f"FAKESAT IMAGER COLLECTS == {collect_cnt + 1}", 5)
        wait_check("FAKESAT IMAGER COLLECT_TYPE == 'SPECIAL'", 5)


class ModeGroup(Group):
    def script_safe(self):
        fakesat = FakeSat()
        fakesat.safe()

    def script_checkout(self):
        fakesat = FakeSat()
        fakesat.checkout()

    def script_operate(self):
        fakesat = FakeSat()
        fakesat.operate()


class OpsSuite(Suite):
    def __init__(self):
        self.add_group(CollectGroup)
        self.add_script(ModeGroup, "script_safe")
        self.add_script(ModeGroup, "script_checkout")
        self.add_script(ModeGroup, "script_operate")
