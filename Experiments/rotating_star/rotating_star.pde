
float count;
void setup(){
size(400,400);
count =0;
}

void draw(){
background(0);
count++;
PImage star = loadImage("white-star-th.png");
imageMode(CENTER);
pushMatrix();
noCursor();
x = mouseX + 1;
y = mousey + 1;
translate(x,y);
rotate(radians(count*2));
scale(random(0.9,1.1));
image(star,0,0,40,40);
popMatrix();
}

