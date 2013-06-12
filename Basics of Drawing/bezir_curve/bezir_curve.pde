 // Drawing bezir curve
 
size(600,200);
smooth();
background(#9F9169);
noFill();

// the first curve
stroke(255);
line(100,50,250,50);
line(100,150,250,150);
stroke(200,0,0);
strokeWeight(3);
bezier(100,50,250,50,100,150,250,150);


stroke(255);
line(300,50,450,10);
line(300,150,550,190);
stroke(200,0,0);
strokeWeight(3);
bezier(300,50,450,10,300,150,550,190);

