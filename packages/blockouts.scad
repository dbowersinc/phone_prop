// Library: blockouts.scad
// Version: 1.0.0
// Author: David Bowers
// Copyright: 2022
// License: 2-clause BSD License (http://opensource.org/licenses/BSD-2-Clause)

// Will render an evenly distibuted set of blocks.
//
// blockouts(thickness:int, length:int, width:int, count); 
//


module blockouts (thickness=3, length=60, width=10, count=5){
    size = [length, thickness, width];
    ctrz = width*(count-1);
    center = [0,0,-ctrz];
    translate(center){
    for ( i = [0:count-1]){
        loc = [0, 0, i*width*2];
        translate(loc)
            cube(size, center=true);
    }
}
}

blockouts();