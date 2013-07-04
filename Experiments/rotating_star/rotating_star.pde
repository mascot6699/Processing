
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
translate(mouseX,mouseY);
rotate(radians(count*2));
scale(random(0.9,1.1));
image(star,0,0,40,40);
popMatrix();
}

