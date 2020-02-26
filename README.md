# LangtonsAnt

Langton's Ant is a grid of cells, where each cell is either "on" (represented by a black cell) or "off" (represented by a
white cell). Somewhere on the board, an ant occupies one cell (represented by a red cell) and is facing a certain 
direction (one of the four cardinal directions). Each generation, the ant will check the whether the cell it occupies is 
"on" or "off":

* If the cell is "on", the ant turns 90 degrees left, flips the cell to "off", and steps forward.
* If the cell is "off", the ant turns 90 degrees right, flips the cell to "on", and steps forward.

Interestingly, if the board begins with every cell as "off", after about 10,000 steps, the ant will begin to spiral off
into infinity (this infinite spiral is named "The Highway"). Additionally, regardless of where the ant starts, its initial
direction, or if there are multiple ants, eventually the ant(s) will form a "Highway". This also holds true
even if the inital board contains some "on" cells.

In this version, the grid wraps around from right to left (and vice versa) as well as top to bottom (and vice versa), 
preventing the ant(s) from spiraling off into infinity. When initiallized, the game will start with 1 ant in the center of the grid.

The file "LangtonsAntEXAMPLE.png" contains a sample of 4 generations with the ant beginning in the middle of the grid.
In the third example, the ant has already began forming the "Highway" and in the fourth example, the ant has collided with its
previous path, but quickly formed another highway.
