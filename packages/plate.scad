// Library: plate.scad
// Version: 1.0.0
// Author: David Bowers
// Copyright: 2022
// License: 2-clause BSD License (http://opensource.org/licenses/BSD-2-Clause)


// Will produce a plate that is centered on x axis and
// aligned with y axis. 
//
// plate(length:int, thickness:int, width:int); 



module plate(length=100, thickness=3, width=100) {
    
    pllocation = [length/2,0,0];
    plsize = [length, thickness, width];
    // blockout sizes
    bonumber = 4;
    bowidth = width/(bonumber*2+1);
    bolength = length - bowidth*2;
    
    translate(pllocation)
            cube(plsize,center=true);
}