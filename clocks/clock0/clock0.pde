
void setup(){
  size(400,300);
  smooth();
  
}

void draw(){
background(0);
textSize(second()*(60-second())/30+20);
textAlign(CENTER, CENTER);
text(nf(hour(),2)+":"+ nf(minute(),2)+":"+nf(second(),2)+"",200,150);
}



