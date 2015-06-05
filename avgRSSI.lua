-- Run getRSSI.lua first before run this file.
-- This script process the data collected by get RSSI.lua, namely :
-- 1. calculate the average value of each list
-- 2. concatenate the average rssi values into a new list


tmr.stop(0)  --stop data collection

function printList(list)
   string = ""
   for k,v in pairs(list) do 
       string = string..","..v
   end
   print(string)
end

--for each AP, print all RSSI value recieved from that AP
for itr = 2,5 do print("R"..itr);printList(R[itr]) end

print("Average:") 
result = {listAvg(R[2]), listAvg(R[3]),listAvg(R[4]),listAvg(R[5])}
--use result as the parameter "vector" in function NN
printList(result)                
