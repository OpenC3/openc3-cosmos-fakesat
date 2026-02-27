# encoding: ascii-8bit

# Copyright 2026 OpenC3, Inc.
# All Rights Reserved.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See LICENSE.md for more details.

# TBL_FILENAME is set to the name of the table file to overwrite
puts "file:#{ENV['TBL_FILENAME']}"
# Download the file
# Implement custom commanding logic to download the table
# You probably want to do something like:
buffer = ''
# i = 1
# num_segments = 5 # calculate based on TBL_FILENAME
# table_id = 1  # calculate based on TBL_FILENAME
# while i < num_segments
#   # Request a part of the table buffer
#   cmd("TGT DUMP with TABLE_ID #{table_id}, SEGMENT #{i}")
#   buffer += tlm("TGT DUMP_PKT DATA")
#   i += 1
# end
put_target_file(ENV['TBL_FILENAME'], buffer)
