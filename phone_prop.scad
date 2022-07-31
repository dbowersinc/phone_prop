// phone or pad holder 
$fa = 1.0;
$fs = 0.4;

// The piece is two cubes held together by
// three tubes (hollow cynlinders)

module tubes(outside, inside, height){
    difference(){
        cylinder(h=height,d=outside,center=true);
        cylinder(h=height+0.1,d=inside, center=true);
    }
}
// How do you cut away at the right angle?
// rotate a cube and translate it.
 
module cuttingwedge(angle=90, outside=21, height=110){
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

module radius(angle=90, inside=15, thickness=3, height=110) {
    // a radius is a tube with a portion cut away.
    outside=inside+thickness*2;
    intersection(){
        tubes(outside, inside, height);
        cuttingwedge(angle, outside, height);
    }
}

module blockouts (thickness=3, length=60, width=10, count){
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

module plates (length=100, thickness=3, width=100) {
    // will produce a plate that is centered on x axis and
    // aligned with y
    pllocation = [length/2,0,0];
    plsize = [length, thickness, width];
    // blockout sizes
    bonumber = 4;
    bowidth = width/(bonumber*2+1);
    bolength = length - bowidth*2;
    
    translate(pllocation)
            cube(plsize,center=true);
}

module leanonme(length, thickness, width, obthickness) {
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
        radius(angles[0],obthickness, thickness, width);
    translate(points[1])
        plates(pl1len, thickness, width);
    translate(points[2])
        rotate(rots[1])
            radius(angles[1],obthickness, thickness, width);
    translate(points[3])
        rotate(rots[0])
            plates(pl2len, thickness, width);
    translate(points[5])
        rotate(rots[2])
            radius(angles[0],obthickness, thickness, width);
            
}

inside = 15;
thickness = 3;
length = 120;
width = 80;

leanonme(length, thickness, width, inside);