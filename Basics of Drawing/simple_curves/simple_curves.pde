// Drawing simple curves

size(600,200);
smooth();
background(#C3CCC8);
strokeWeight(3);

stroke(#442412);
curve(100,300,100,100,200,100,200,300);

noFill();
stroke(#B99619);
curveTightness(3);
curve(250,300,250,100,350,100,350,300);

noFill();
stroke(#BBB619);
curveTightness(-3);
curve(400,300,400,100,500,100,500,300);

