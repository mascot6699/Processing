class Ball
{
  int x, y, vx, vy;
  Ball(int start_x, int start_y, int x_vel, int y_vel)
  {
    x = start_x;
    y = start_y;
    vx = x_vel;
    vy = y_vel;
  }

  void update()
  { 
    x += vx;
    y += vy;
    if (x <= 20 || x >= width-20) {
      vx = -vx;
    }
    if (y <= 60 || y >= height-20) {
      vy = -vy;
    }
  }
}

int score;
int count;
int level;
PImage star;
PImage [] starimages;
boolean in_play;
Ball[] enemys;
Ball star1;

void setup()
{ 
  size(800, 600);
  smooth();
  ellipseMode(RADIUS);
  score = 0;
  level =1;
  in_play = true;
  enemys = new Ball[100];
  star1 = generate_ball();
  enemys[0] = generate_ball();
  enemys[1] = generate_ball();
  enemys[2] = generate_ball();
  enemys[3] = generate_ball();
  enemys[4] = generate_ball();
  enemys[5] = generate_ball();
  star = loadImage("white-star-th.png");
  starimages = loadImages("sc-gellostars", ".png", 5);
  frameRate(60);
}

void draw()
{
  if (in_play)
  {
    background(0);
    fill(#77AB59);
    noStroke();
    //noCursor();
    ellipse(mouseX, mouseY, 15, 15);
    count++;
    imageMode(CENTER);
    pushMatrix();
    translate(star1.x, star1.y);
    rotate(radians(count*4));
    scale(random(0.9, 1.2));
    image(star, 0, 0, 40, 40);
    popMatrix();
    star1.update();
    fill(#E2FF9E);
    stroke(#F0F2DD);
    strokeWeight(5);
    for (int i = 0; i < level * 5; i++)
    { 
      enemys[i].update();
      //ellipse(enemys[i].x, enemys[i].y, 15, 15);
      {pushMatrix();
    translate(enemys[i].x, enemys[i].y);
    rotate(radians(count*4));
    scale(random(0.9, 1.2));
    image(starimages[i%5], 0, 0, 40, 40);
    popMatrix();
      }
      if (dist(mouseX, mouseY, enemys[i].x, enemys[i].y) <30)
      {
        in_play = false;
      }
    }
    if (dist(mouseX, mouseY, star1.x, star1.y) < 30)
    {
      score++;
      level = int(score/10) + 1;
      enemys[score] = generate_ball();
      star1 = generate_ball();
    }
    textSize(20);
    fill(#9FB3B2);
    text("Score : " + score, width/2 -150, 30);
    text("Level : " + level, width/2 +100, 30);
  }
  else
  {
    fill(255);
    textSize(70);
    text("GAME OVER!!!", width / 2 - 230, height / 2);
  }
}
Ball generate_ball()
{
  int x, y, vx, vy;
  do
  {
    x = (int) random(30,width-30);
    y = (int) random(60 ,height-30);
  } 
  while (dist (mouseX, mouseY, x, y) < 80);
  vx = (int) random(0,4+level);
  vy = (int) random(0,4+level);
  return new Ball(x, y, vx, vy);
}


void mousePressed()
{
  setup();
}

//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}

