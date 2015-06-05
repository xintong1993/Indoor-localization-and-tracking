--1.Run getRSSI.lua and avgRSSI.lua before running this script
--2.This script determine which reference point is closest to the tag by 
--  comparing rssi patterns recieved by the tag and that of the reference points in the database.

--setup databse first{p1,...,pn}
p1={-63.333333,-67,-57,-60.58};p2={-67.25,-71.125,-62,-53.875};--p3={3,7,2};p4={5,4,1};p5={3,1,6}
database = {p1,p2}

function NN(table,vector)
   length=0
   for i,v in ipairs(vector) do   --size of list = # of AP
      length = length + 1
   end
   min = 100000
   for i,p in pairs(database) do 
      d=0                        --distance between target and an element p in the database  
      for itr = 1,length do      --traverse p and compute distance
      d = d + (p[itr]-vector[itr])^2
      -- print("debug1:",i,itr,d)
      end
      --print("debug2: p"..i,d)
      if d<min then 
         min = d
         res = i
      end
   end
   return res
end

print("The nearest neightbour is p"..NN(database,result)) 
