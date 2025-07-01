$fa=1;
$fs=0.4;

use </home/ntynen/tmp/threads.scad>;

both();

module stub()
{
    difference()
    {
        cylinder(h=4, r1=7.55, r2=7.65);
    }
}
 
module sleeve()
{ 
    
    difference()
    {
        cylinder(h=5.5, r=7.95);
        translate([0, 0, 2])
            cylinder(h=4.5, r=7.65);
        translate([0,0,-0.15])
            cylinder(h=1.5, d=4);
    }
}

module thread()
{
    ScrewThread(4, 10, pitch=0, tooth_angle=30, tolerance=0.4, tip_height=0, tooth_height=0, tip_min_fract=0);
}

module rod(){
    cylinder(d=4, h=43);
}

module both()
{
    sleeve();
    rotate([0, 90, 0])
    union()
        {
            translate([0, 15, 0])
                rod();
            translate([0, 15, -9.75-0.001])
                thread();
        }
}

