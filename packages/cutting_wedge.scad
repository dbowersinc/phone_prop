// Library: cutting_wedge.scad
// Version: 1.0.0
// Author: David Bowers
// Copyright: 2022
// License: 2-clause BSD License (http://opensource.org/licenses/BSD-2-Clause)

// Will produce a wedge to be used with difference();
// cutting_wedge(angle:int, outside:int, height:int); 


module cutting_wedge(angle=90, outside=21, height=110){
    cutters = [outside*2,outside,height+0.5];
    echo (angle);
    difference(){
        cylinder(h=height,d=outside,center=true);
        rotate([0,0,angle])
        translate([outside,outside/2,-0.1])
        cube(cutters,center=true);
        translate([0,-outside/2,-0.1])
        cube(cutters,center=true);
    }
}

cutting_wedge();