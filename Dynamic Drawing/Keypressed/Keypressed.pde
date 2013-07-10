//Playing with keypresses

color[] styleyou = {#262B30, #E09A25, #F0D770, #F2EDBC, #C51C30};
color[] palette = styleyou;

int i = 1;
int y =75;
int x = 300;

void setup(){
  size(600, 200);
  smooth();
  stroke(palette[4]);
  strokeWeight(5);
}

void draw(){
  background(palette[0]);
  fill(palette[i]);
  ellipse(x, y, 50, 50);
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == RIGHT) {
      x = x+3;
    } else if (keyCode == LEFT) {
      x =x-3;
    }else if (keyCode == UP) {
      y =y-3;
    }else if (keyCode == DOWN) {
      y =y+3;
    }
  
}}

void mousePressed(){
  i = int(random(1, 5));
}
