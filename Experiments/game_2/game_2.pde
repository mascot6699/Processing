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

int score, sum;
int count, cheat;
int level;
PImage star, hrt , back1 , back2;
PImage [] starimages;
Slider vol;
int in_play;
boolean captured;
Ball[] enemys;
Ball star1;
AudioPlayer player , eat, over , back , buzz, life;
float over1;
void setup()
{ 
  sum=0;
  size(800, 600);//remove if on android mode
  smooth();
  ellipseMode(RADIUS);
  cheat = 0;
  score = 0;
  level =1;
  over1 =0;
  in_play = 3;
  captured = false;
  enemys = new Ball[100];
  star1 = generate_ball();
  enemys[0] = generate_ball();
  enemys[1] = generate_ball();
  enemys[2] = generate_ball();
  enemys[3] = generate_ball();
  enemys[4] = generate_ball();
  enemys[5] = generate_ball();
  star = loadImage("white-star-th.png");
  hrt = loadImage("heart.png");
  back1 = loadImage("b1.jpg");
  back2 = loadImage("b2.jpg");
  starimages = loadImages("sc-gellostars", ".png", 5);
  frameRate(60);
  maxim = new Maxim(this);
  player = maxim.loadFile("levelup.wav");
  player.setLooping(false);
  eat = maxim.loadFile("chime.wav");
  eat.setLooping(false);
  eat.volume(1);
  life = maxim.loadFile("gainlife.wav");
  life.setLooping(false);
  life.volume(1);
  buzz = maxim.loadFile("buzzer.wav");
  buzz.setLooping(false);
  buzz.volume(1.4);
  over = maxim.loadFile("dies.wav");
  over.setLooping(false);
  back = maxim.loadFile("background.wav");
  back.setLooping(true);
  vol = new Slider("vol", 0.75, 0, 1, 20, 10, 200, 20, HORIZONTAL);
}

void draw()
{ 
  if (in_play>0)
  {
    back.speed(0.4+level*0.04);
    back.play();
    imageMode(CORNER);
    if(level%2==0)
    image(back1,0,0);
    else
    image(back2,0,0);
    vol.display();
    back.volume(vol.get());
    fill(#77AB59);
    strokeWeight(1);
    line(0, 35, width, 35);
    noStroke();
    //remove if in android mode 
    if(mouseY>35){
    noCursor();
    ellipse(mouseX, mouseY, 15, 15);}
    else cursor();
    
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
    if ( millis() % 20000 <= 18000 && millis()%20000 >= 16000 && captured == false) {
      if (millis()%2==0)
        tint(255, 0, 0);
      else
        tint(0, 0, 255);
      imageMode(CENTER);
      image(hrt, width/2, height/2, 40, 40);
      if (dist(mouseX, mouseY, width/2, height/2)<25) {
        captured = true;
        life.cue(0);
        life.play();
        in_play++;
      }
      
    }
    noTint();
    if(millis()%20000 == 19000){captured = !captured;}

    for (int i = 0; i < (level * 5)-cheat; i++)
    { 
      enemys[i].update();
      {
        pushMatrix();
        translate(enemys[i].x, enemys[i].y);
        rotate(radians(count*4));
        scale(random(0.9, 1.2));
        image(starimages[i%5], 0, 0, 40, 40);
        popMatrix();
      }
      if (dist(mouseX, mouseY, enemys[i].x, enemys[i].y) <30)
      {
        in_play--;
        buzz.cue(0);
        buzz.play();
        enemys[i].x =int(random(40, width-40));
        enemys[i].y = enemys[i].y -50;
      }
    }
    if (dist(mouseX, mouseY, star1.x, star1.y) < 30)
    {
      score++;
      eat.play();
      if (score%10==0) {
        captured = false;
        player.play();
      }
      level = int(score/10) + 1;
      enemys[score] = generate_ball();
      star1 = generate_ball();
    }
    textSize(20);
    fill(#9FB3B2);
    text("Score : " + score, 300, 30);
    text("Level : " + level, 500, 30);
    image(hrt, (width - 120), 20, 25, 25);
    text(" X " + in_play, width-100, 30);
  }
  else
  { 
    if (over1==0)over.play();
    over1++;
    if (over1==3600)exit();
    fill(255);
    textSize(30);
    textAlign(CENTER);
    back.stop();
    text("GAME OVER!!!", width/2, height/2);
    text("Double-Click for new game", width/2, height/2+100);
  }
}
Ball generate_ball()
{
  int x, y, vx, vy;
  do
  {
    x = (int) random(30, width-30);
    y = (int) random(60, height-30);
  } 
  while (dist (mouseX, mouseY, x, y) < 80);
  vx = (int) random(0, 4+level);
  vy = (int) random(0, 4+level);
  return new Ball(x, y, vx, vy);
}


void mousePressed()
{ 
  if (mouseY>80){
    sum++;
  if (sum>2) {
    back.stop();
    setup();
  }}
}

void keyPressed() {

  if (keyPressed)
  {
    if (key=='c'||key=='C')
      cheat++;
  }
}

void mouseReleased(){
  vol.mouseReleased();
  
}



