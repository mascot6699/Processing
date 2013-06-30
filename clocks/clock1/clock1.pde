
void setup(){
  size(400,400);
  smooth();
  background(#000000);
}

void draw(){
stroke(255,0,0);
strokeWeight(7);
ellipse(200,200,250,250);
stroke(0);
point(200,200);

strokeWeight(1);
hands(110,second(),60);

strokeWeight(2);
hands(100,minute(),60);

strokeWeight(4);
hands(60,hour(),12);

}

void hands(float size , float variation, float divideby)
{
float x = 200 +size * cos(variation * TWO_PI /divideby - PI / 2.0);
float y = 200 +size * sin(variation * TWO_PI /divideby - PI / 2.0);
line(200,200,x,y);
}




