#Indoor localization and tracking

This is the exploration of indoor localizaiton algorithm using fingerprinting method.

In particular, I used nearest neighbour method to determine the closest reference point.

Algorithm: Indoor localization using NN

  Setup database {p1,...,pn}
  
  Input: list of RSSI values received by the tag from different AP
  
  Output: reference point pi which is most likely to be the positon of the tag
  
     1. locate n APs in the sample area, record its coordinates.
     
     2. Choose several reference points. 
     
     3. For each point, compute and record a list RSSI from each AP. 
     
     4. Place the tag in the sample space and record RSSI values.
     
     5. Compare tag's RSSI pattern to that of the points in database.
     
     6. Get the reference point that has the smallest difference in RSSI values.
