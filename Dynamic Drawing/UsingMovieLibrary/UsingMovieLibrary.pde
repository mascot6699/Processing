// Ex08_03

import processing.video.*;

Movie trainMovie;

void setup() {
  size(640, 480);
  background(0);
  trainMovie = new Movie(this, "station.mov");
  trainMovie.loop();
}

void movieEvent(Movie trainMovie) {
  trainMovie.read();
}

void draw() {
  image(trainMovie, 0, 0);
  //image(trainMovie, mouseX, mouseY);
}
