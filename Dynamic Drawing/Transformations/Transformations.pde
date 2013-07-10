// Playing with transform rotate and scale

color[] chemistry = {#0C2550, #A3D0C1, #FDF6DD, #FEE406, #F4651C};
color[] palette = chemistry;

int s = 80;
int d = 10;

size(600, 200);
smooth();
noStroke();
background(palette[0]);

fill(palette[1]);
rect(0, 0, s, s);
fill(palette[4]);
ellipse(0, 0, d, d);

// translate
translate(40, 90);
fill(palette[2]);
rect(0, 0, s, s);
fill(palette[4]);
ellipse(0, 0, d, d);

// scale
translate(140, -70);
scale(2);
fill(palette[3]);
rect(0, 0, s, s);
scale(.5);
fill(palette[4]);
ellipse(0, 0, d, d);

// rotate
translate(280, 10);
scale(1.33);
rotate(PI*.25);
//rotate(radians(90));
fill(palette[1]);
rect(0, 0, s, s);
scale(.5);
fill(palette[4]);
ellipse(0, 0, d, d);
