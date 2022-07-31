// Library: phone_prop.scad
// Version: 1.0.0
// Author: David Bowers
// Copyright: 2022
// License: 2-clause BSD License (http://opensource.org/licenses/BSD-2-Clause)

// phone_prop(); 
//   Made to export a 3D printable stl file from.abs

// EXAMPLE USAGE:
// PhoneProp();
//   export stl file and import it into your printer software. 


// Comment out these two lines if rendering is to slow.
$fa = 1.0;
$fs = 0.4;

// The piece is two cubes held together by
// three tubes (hollow cynlinders)

use <./packages/cup.scad>;
use <./packages/plate.scad>;


// Dimensions:
inside = 18;      // Thickness of phone
thickness = 3;    // Thickness of piece 
length = 120;     // Length of long side
width = 80; 


module phone_prop(length, thickness, width, obthickness) {
    //translate();
    height = length/2;
    // point reference    
    clr = obthickness/2 + thickness/2;
    clr3 = 3*clr;
    clr2 = 2*clr;
    pl1len = length - clr3;
    pl2len = height - clr3;
    angles = [155, 90];
    points = [
        [0,0,0],
        [0,clr,0],
        [pl1len,clr2,0],
        [pl1len+clr,clr2,0],
        [pl1len+clr,clr2+pl2len,0],
        [pl1len+clr2,clr2+pl2len,0]
        ];
    rots = [
        [0,0,90],
        [0,0,270],
        [0,180,0]
        ];
        
    rotate(rots[0])
        cup(angles[0],obthickness, thickness, width);
    translate(points[1])
        plate(pl1len, thickness, width);
    translate(points[2])
        rotate(rots[1])
            cup(angles[1],obthickness, thickness, width);
    translate(points[3])
        rotate(rots[0])
            plate(pl2len, thickness, width);
    translate(points[5])
        rotate(rots[2])
            cup(angles[0],obthickness, thickness, width);
            
}


phone_prop(length, thickness, width, inside);