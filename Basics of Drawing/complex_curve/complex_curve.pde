//Drawing complex curves

size(600,200);
smooth();
noFill();

//Black curve
stroke(0);
beginShape();
curveVertex(100,100);
curveVertex(100,100);
curveVertex(150,150);
curveVertex(260,50);
curveVertex(340,50);
curveVertex(430,190);
curveVertex(500,100);
curveVertex(500,100);
endShape();

//Gray curve
stroke(100);
beginShape();
curveTightness(-2);
curveVertex(100,100);
curveVertex(100,100);
curveVertex(150,150);
curveVertex(260,50);
curveVertex(340,50);
curveVertex(430,190);
curveVertex(500,100);
curveVertex(500,100);
endShape();

//Gray curve
stroke(255);
beginShape();
curveTightness(4);
curveVertex(100,100);
curveVertex(100,100);
curveVertex(150,150);
curveVertex(260,50);
curveVertex(340,50);
curveVertex(430,190);
curveVertex(500,100);
curveVertex(500,100);
endShape();


stroke(200,0,0);
strokeWeight(5);
point(100,100);
point(150,150);
point(260,50);
point(340,50);
point(430,190);
point(500,100);

