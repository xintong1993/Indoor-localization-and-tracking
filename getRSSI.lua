--- collect RSSI values at fixed distance from desired AP
--- for each AP create a list of RSSI value
--- print RSSI values on screen intermittently

wifi.setmode(1)
R={};tmp={}                  --initialize list of APs and table of RSSI
for itr=2,6 do R[itr] = {} end

--get average value of a intger list
function listAvg(list)
   num=0;sum=0
   for i,v in pairs(list) do
      num = num + 1; sum = sum + tonumber(v)
   end
   if num == 0 then print ("No element in list")
   else 
       avg = sum/num 
       return avg    
   end
end

--calculate distance between tag and AP using recieved RSSI value
function rssiToDistance(initial,average,const)
   res = 10^((initial-average)/const)
   return res
end

--get RSSI values from specific AP 
function listap(t)
      for ssid,v in pairs(t) do
        authmode, rssi, bssid, channel = string.match(v, "(%d),(-?%d+),(%x%x:%x%x:%x%x:%x%x:%x%x:%x%x),(%d+)")
        if ssid=="Reference02" then 
            table.insert(R[2],rssi)
            tmp[2] = rssi 
        end   
        if ssid=="Reference03" then 
            table.insert(R[3],rssi)
            tmp[3] = rssi
        end
        if ssid=="ESP_A6402B" then 
            table.insert(R[4],rssi)
            tmp[4] = rssi 
        end   
        if ssid=="ESP_A64076" then 
            table.insert(R[5],rssi)
            tmp[5] = rssi
        end        
      end
      print("Ref02",tmp[2],"   "..rssiToDistance(-45,tmp[2],30).."m","Ref03",tmp[3],"   "..rssiToDistance(-45,tmp[3],30).."m")
      print("Ref04",tmp[4],"   "..rssiToDistance(-45,tmp[4],30).."m","Ref05",tmp[5],"   "..rssiToDistance(-45,tmp[5],30).."m")
end
    wifi.sta.getap(listap)
    
tmr.alarm(0,3000,1,function() wifi.sta.getap(listap) end)
