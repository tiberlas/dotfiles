#!bin/lua
--[[
################################################################################
#
#  _    _   _ _               _
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     debian based system update with brew
# | __|| __| | '_ \ / _ \ '__| | | | / __|
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/
#
################################################################################
]]--

print"\27[0;34mAPT-GET update...\27[0m"
os.execute"sudo apt-get update -y"

print"\27[0;34mAPT-GET upgrade...\27[0m"
os.execute"sudo apt-get upgrade -y"

print"\27[0;34mAPT-GET auto remove...\27[0m"
os.execute"sudo apt-get autoremove -y"

print"\27[0;34mAPT-GET clean...\27[0m"
os.execute"sudo apt-get clean -y"

print"\27[0;34mBREW update...\27[0m"
os.execute"brew update"

print"\27[0;34mBREW upgrade...\27[0m"
os.execute"brew upgrade"

print"\27[101;93mSYSTEM UPDATE DONE\27[0m"
