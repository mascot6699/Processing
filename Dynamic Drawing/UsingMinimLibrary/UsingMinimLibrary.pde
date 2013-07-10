import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Using minim
//Beads is another good library look into it too
Minim s1;
AudioPlayer player1;

void setup(){
  size(400, 250);

  // Sound
  s1 = new Minim(this);
  player1 = s1.loadFile("Bird.mp3");
  player1.play();
}  
void draw(){}
/*
void stop() {
  birdSong.close();
  soundCode.stop();
  super.stop();
}*/
