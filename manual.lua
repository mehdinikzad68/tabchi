redis = (loadfile "redis.lua")()
io.write("Enter Tabchi ID : ")
local last = io.read()
io.write("\nEnter Full Sudo ID : ")
local sudo=io.read()
local text,ok = io.open("base.lua",'r'):read('*a'):gsub("TABCHI%-ID",last)
io.open("tabchi-"..last..".lua",'w'):write(text):close()
io.open("tabchi-"..last..".sh",'w'):write("while true; do\n./telegram-cli-1222 -p tabchi-"..last.." -s tabchi-"..last..".lua\ndone"):close()
io.popen("chmod 777 tabchi-"..last..".sh")
redis:set('tabchi:'..last..':fullsudo',sudo)
print("Done!\nNew Tabchi Created...\nID : "..last.."\nFull Sudo : "..sudo.."\nRun : ./tabchi-"..last..".sh")
print('Version 4 Of Tabchi')
