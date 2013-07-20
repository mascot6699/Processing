import controlP5.*;
ControlP5 cp5;
int myColor = color(0,0,0);
int colorR = 100;
int colorG = 100;
int colorB = 100;

void setup() {
  size(600,400);
  noStroke();
  cp5 = new ControlP5(this);
  cp5.addSlider("colorR")
     .setPosition(50,40)
     .setSize(200,40)
     .setRange(0,255)
     ;
  cp5.addSlider("colorG")
     .setPosition(50,120)
     .setSize(200,40)
     .setRange(0,255)
     ;
  cp5.addSlider("colorB")
     .setPosition(50,200)
     .setSize(200,40)
     .setRange(0,255)
     ;
}
void draw() {
  background(0,0,0);
  fill(colorR,colorG,colorB);
  rect(300,240,width,height);
}
