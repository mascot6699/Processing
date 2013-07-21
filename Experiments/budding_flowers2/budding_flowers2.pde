//Buddding flowers


float x;
float y = 300;
void setup(){
  size(600,300);
  background(0);
  smooth();
  frameRate(40);
}
void draw(){
if(frameCount % 60 ==0){
buildplant();}
}



