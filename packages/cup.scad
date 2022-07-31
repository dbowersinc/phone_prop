// Library: cup.scad
// Version: 1.0.0
// Author: David Bowers
// Copyright: 2022
// License: 2-clause BSD License (http://opensource.org/licenses/BSD-2-Clause)

// cup(angle:int, inside:int, thickness:int, height:int); 
//   Made to export a 3D printable stl file from.abs

// EXAMPLE USAGE:
// cup(
//    angle:int
//        The angle to which the arc will extend. 
//    inside:int
//        The diameter of the inside circle. 
//    thickness:int 
//        The thickness of the arc. 
//    height:int
//        The height of the cup. 
//  );
//   

use <./tube.scad>;
use <./cutting_wedge.scad>;
 

module cup(angle=90, inside=15, thickness=3, height=110) {
    // a cup is an arc line with thickness. 
    outside=inside+thickness*2;
    intersection(){
        tube(outside, inside, height);
        cutting_wedge(angle, outside, height);
    }
}

cup();