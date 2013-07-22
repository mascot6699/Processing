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
Maxim maxim;

int score,sum;
int count;
int level;
PImage star;
PImage [] starimages;
boolean in_play;
Ball[] enemys;
Ball star1;
AudioPlayer player;
AudioPlayer eat;
AudioPlayer over;
AudioPlayer back;
float over1;
void setup()
{ sum=0;
  size(800, 600);//remove if on android mode
  smooth();
  ellipseMode(RADIUS);
  score = 0;
  level =1;
  over1 =0;
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
  maxim = new Maxim(this);
  player = maxim.loadFile("levelup.wav");
  player.setLooping(false);
  eat = maxim.loadFile("chime.wav");
  eat.setLooping(false);
  eat.volume(1);
  over = maxim.loadFile("dies.wav");
  over.setLooping(false);
  back = maxim.loadFile("background.wav");
  back.setLooping(true);
  back.volume(0.75);
}

void draw()
{ 
  if (in_play)
  { back.speed(0.4+level*0.04);
    back.play();
    background(0);
    fill(#77AB59);
    strokeWeight(1);
    line(0,35,width,35);
    noStroke();
    noCursor();//remove if in android mode 
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
      eat.play();
      if(score%10==0){player.play();}
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
  { if(over1==0)over.play();
    over1++;
    if(over1==3600)exit();
    fill(255);
    textSize(30);
    textAlign(CENTER);
    back.stop();
    text("GAME OVER!!!", width/2 , height/2);
    text("Double-Click for new game", width/2 , height/2+100); }
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
{sum++;
  if (sum>2) {
  back.stop();
  setup();}
}

