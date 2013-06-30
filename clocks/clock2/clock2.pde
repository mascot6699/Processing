
void setup(){
  size(500,500);
  smooth();
  background(0);
}

void draw(){
stroke(78,20,150);
strokeWeight(7);
fill(255);
ellipse(250,250,350,350);
beginShape();
noStroke();
if(second()%2==0){
fill(150,15,150);}
else{
fill(100,15,135);}
vertex(250,220);
vertex(276,235);
vertex(276,265);
vertex(250,280);
vertex(224,265);
vertex(224,235);
endShape(CLOSE);
stroke(255,0,0);
strokeWeight(2);
hands(150,minute(),60);
strokeWeight(4);
hands(100,hour(),12);

}

void hands(float size , float variation, float divideby)
{
float x = 250 +size * cos(variation * TWO_PI /divideby - PI / 2.0);
float y = 250 +size * sin(variation * TWO_PI /divideby - PI / 2.0);
line(250,250,x,y);
}




