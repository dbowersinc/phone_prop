// Library: tube.scad
// Version: 1.0.0
// Author: David Bowers
// Copyright: 2022
// License: 2-clause BSD License (http://opensource.org/licenses/BSD-2-Clause)

// tube(outside:int, inside:int, height:int); 


module tube(outside, inside, height){
    difference(){
        cylinder(h=height,d=outside,center=true);
        cylinder(h=height+0.1,d=inside, center=true);
    }
}