#Indoor localization and tracking

This is the exploration of indoor localizaiton algorithm using fingerprinting method.

In particular, I used nearest neighbour method to determine the closest reference point.

Algorithm: Nearest neighbour method

  Setup database {p1,...,pn}
  
  Input: list of RSSI values received by the tag from different AP
  
  Output: reference point pi which is most likely to be the positon of the tag
  
     1. locate n APs in the sample area, record its coordinates.
     
     2. Choose several reference points. 
     
     3. For each point, compute and record RSSI of each AP. 
     
     4. Randomly place the tag in the sample space and record RSSI values.
     
     5. Compare the RSSI values of current position to the database.
     
     6. Get the reference point that has the smallest difference in RSSI pattern.
