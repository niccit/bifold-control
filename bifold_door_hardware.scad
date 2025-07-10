$fa=1;
$fs=0.4;

use </home/ntynen/tmp/threads.scad>;

door_hardware();
// set to true if you want to print your own collar
sleeve = false;



// Use this if you need your own collar for securing the knob
// I ended up just working with the collar I had
module sleeve()
{ 
    
    difference()
    {
        cylinder(h=5.5, d=15.9);
        translate([0, 0, 2])
            cylinder(h=4.5, d=15.3);
        translate([0,0,-0.15])
            cylinder(h=6, d=4);
        translate([0, 0, 1])
            inset();
    }
}

// an insent within the collar so the button screw lays flat
module inset(){
    cylinder(d=5, h=1);
}

// Screw thread, only need enough to show through the back of the door
module thread()
{
    ScrewThread(4, 12, pitch=0, tooth_angle=30, tolerance=0.4, tip_height=0, tooth_height=0, tip_min_fract=0);
}

// The rod and button to complete the button head screw
module rod(){
    union(){
        cylinder(d=4, h=36);
        translate([0, 0, 36-0.001])
            cylinder(d=5.75, h=1);
    }
}


module door_hardware()
{
    if (sleeve == true){
        sleeve();
        rotate([0, 90, 0])
            union()
                {
                    translate([0, 15, 0])
                        rod();
                    translate([0, 15, -11.5-0.001])
                        thread();
                }
    }
    else {
        rotate([0, 90, 0])
            union()
                {
                    translate([0, 0, 0])
                        rod();
                    translate([0, 0, -11.5-0.001])
                        thread();
                }
    }
}

