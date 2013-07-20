int nr = 12;
int radius = 20;
int speedlimit = 5;
Circle[] circles;
color names[] = {#635353, #A29494, #C2C5CE, #FEF7FE,#65727A, #8F9A9C, #D7DACF, #E6E8E3,#8BA6AC, #BDCDD0, #E5E6C9, #F8F8EC,#ADD8C7, #E3F6F3, #F4F7F7, #FAF0FE};
void setup()
{
  size(500, 500);
  circles = new Circle[nr];
  for (int i=0; i<nr; i++) {
    circles[i] = new Circle(int(random(radius,width-radius)),int(random(radius,height-radius)),radius,names[int(random(0,15))]);
} 
  
}

class Circle {
  int radius;
  public color colour;
  public int posx;
  public int posy;
  public int speedx;
  public int speedy;
 
  Circle(int x, int y, int r,color c) {
    this.posx = x;
    this.posy = y;
    this.radius = r;
    this.colour = c;
    move(x,y,c);
    speedx = 0;
    while (speedx == 0) {
      speedx = (int)random(-1*speedlimit,speedlimit);
    }
    speedy = 0;
    while (speedy == 0) {
      speedy = (int)random(-1*speedlimit,speedlimit);
    }
  } 
  
  void move(int x, int y , color c) {
     this.posx = x;
     this.posy = y;
     strokeWeight(3);
     fill(c);
     ellipse(posx,posy,(2*radius),(2*radius));
     
  }
  
}

void draw() {
 background(#88C100);

 for (int i=0; i<circles.length; i++) {
   if ((circles[i].posx-radius <= 0) || (circles[i].posx +radius >= width)) {
     circles[i].speedx *= -1;
   }
   if ((circles[i].posy - radius <= 0) || (circles[i].posy+ radius >= height)) {
     circles[i].speedy *= -1;
   }
   circles[i].move(circles[i].posx+circles[i].speedx,circles[i].posy+circles[i].speedy,circles[i].colour);
 }
 
}
