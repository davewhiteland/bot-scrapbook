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

object {
   create_bot(with_textures)
   rotate y * 0
}

object {
  create_bot(without_textures)
  rotate y * 40
  translate <-4, 0, 2.5>
}

object {
  create_bot(without_textures)
  rotate y * -30
  translate <6, 0, 5>
}

object {
  create_bot(without_textures)
  rotate y * -10
  translate <-12, 0, 10>
}

object {
  create_bot(without_textures)
  rotate y * 45
  rotate z * -90
  rotate y * -10
  translate <2, 0, 3>
}


light_source { default_light }
light_source { default_flood_light }

background{ Black }

camera {
  location  <0, 3, -6.5>
  direction <0, 0, 1.5>
  up        <0, 1, 0>
  right     <3, 0, 0>
  blur_samples 128
  aperture 0.25 
  focal_point <0,2,0>
  look_at   <0,1.7, 0>
}
