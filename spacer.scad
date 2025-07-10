$fa=1;
$fs=0.4;

// A simple spacer
// Initially I thought my project needed this to better secure the door hardware
// In the end I didn't need it, but you never know when you'll need a spacer!

// set this for your spacer requirements
spacer_size = 4;
spacer_diam = 12;
spacer_center_hole = 5;

difference()
   {
      cylinder(h=spacer_size, d=spacer_diam);
      translate([0, 0, -2])
         cylinder(h=(spacer_size*2), d=spacer_center_hole);
   }


