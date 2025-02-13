// Simple bot-on-white scene
// Handy for a starting point for more complex scenes
// Bot is positioned dead centre of frame, toe-to-top visible
// Note: no interesting reflections on bot in an empty scene like this

#include "colors.inc"
#include "everypolitician-bot.inc"
#include "everypolitician-bits.inc"

#declare with_textures = 1;
#declare without_textures = 0;

#declare r1 = seed(0);

#declare ep_diagram_blue = rgb <0, 150, 255>/255;
#declare ep_diagram_pale_blue = rgb <118, 214, 255>/255;

#declare arrow_thickness = 0.1;

#declare arrow = 
  prism {
    linear_spline
    0, -arrow_thickness, 
    8, // number of points
    <0,0>,
    <1.1,-3>,
    <0.5,-3>
    <0.5,-10000>
    <-0.5,-10000>
    <-0.5,-3>
    <-1.1,-3>,  
    <0,0>
    translate y * arrow_thickness/2
  }

union {
   object {
     create_bot(with_textures)
     scale 0.5
   }
   object{
     arrow 
     rotate y * 180
     translate z * -2.25
     pigment { ep_diagram_blue }
     finish { ambient 0.5 }
   }
   rotate z * -30
   rotate y * 40
   translate <0, 1.666, -2>
}


#declare spread_x = 30;
#declare spread_y = 30;
#declare spread_z = 20;

#declare qty_arrows = 100;

#declare bump = rand(r1);

union {
  #declare i = 0;
  #while (i < qty_arrows)
    object {
      arrow
      pigment { ep_diagram_blue }
      finish { ambient 0.5 }
      rotate y * 90
      rotate x * rand(r1) * 60
      rotate y * (i * 40/qty_arrows )
      translate x * (rand(r1) * spread_x - spread_x/2)
      translate y * (rand(r1) * spread_y - spread_y/2)
      translate z * (rand(r1) * spread_z + spread_z/2)
    }
    #declare i = i + 1;
  #end
  translate x * 2
}

// make a box with round ends
// centred on origin, running along the x-axis, flat side towards z
// (see RadiusBox macro from everypolitician-bot.inc)
#macro RadiusBox2(Length, Height, Thickness, Rad)
  union {
    object {
      RadiusBox(Length, Thickness, Rad)
      translate y * Height/2
    }
    object {
      RadiusBox(Length, Thickness, Rad)
      translate -y * Height/2
    }
    box {
     <Length/2 + Rad, (Height + Rad/2)/2, Thickness/2>
     <Length/2 + Rad, (Height + Rad/2)/2, Thickness/2> * -1
    }
  }
#end

#declare diagram_box_texture =  texture {
  pigment { ep_diagram_pale_blue }
  finish { ambient 0.8 }
}

object {
  RadiusBox2(5, 3, 0.1, 0.5)
  texture{ diagram_box_texture }
  translate <15, 4, 20>
}
object {
  RadiusBox2(5, 4, 0.1, 0.5)
  texture{ diagram_box_texture }
  translate <5, 0, 21>
}
object {
  RadiusBox2(4, 6, 0.1, 0.5)
  texture{ diagram_box_texture }
  translate <25, 2, 22>
}
object {
  RadiusBox2(6, 5, 0.1, 0.5)
  texture{ diagram_box_texture }
  translate <10, -8, 23>
}
object {
  RadiusBox2(6, 8, 0.1, 0.5)
  texture{ diagram_box_texture }
  translate <20, -4, 24>
}
object {
  RadiusBox2(30, 30, 0.1, 0.5)
  texture{ diagram_box_texture }
  translate <-60, 0, 100>
}

light_source { default_light }
light_source { default_flood_light }

background{ White }

camera {
  location  <0, 3, -6.5>
  direction <0, 0, 1.5>
  up        <0, 1, 0>
  right     <3, 0, 0>
  blur_samples 128
  aperture 0.07
  focal_point <0,2.2,-0.5>
  look_at   <0,1.7, 0>
}
