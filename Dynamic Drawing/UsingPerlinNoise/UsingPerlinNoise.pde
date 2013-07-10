// Using perlin noise

int n = 100;
int x;
float y = .05;
float noiseY;

size(600, 200);
background(255);
stroke(100);

for(int i = 1; i < n; i++) {
  y += .02;
  x = i* (width/n);
  noiseY = noise(y) * height;
  line(x, height, x, noiseY);
}
