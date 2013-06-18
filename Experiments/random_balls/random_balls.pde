//colour balls
void setup(){
size(275,275);
background(255);
smooth();}
int y= 10;
int x= 80;
void draw(){
background(255-y,y-10,y%60);
strokeWeight(3);
fill(255-x,x-10,x%60);
ellipse(y+20,x+20,20,20);
y++;
if (second()%3==0)
{x++;}
else{
x--;}
if (y > width-30 || y<0) {
y = int(random(20,230));}
if (x > height-30 || x<0) {
x = int(random(20,230));}
}
