// pencil sketches
size(600, 200);
background(255);
smooth();
stroke(100, 50);

int n = 1000;
float[] xTop = new float[n];
float[] xBottom = new float[n];


for(int i = 0; i < n; i++) {
  
  xTop[i] = random(50, 550);
  xBottom[i] = random(50, 550);
 line(xTop[i],25, xBottom[i],175);
}
