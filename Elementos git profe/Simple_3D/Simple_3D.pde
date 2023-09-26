size(640,360,P3D);
//necesario para Mac Os
//En las pref se setea en qué monitor se ejecutan los sketch
frameRate(30);
background(0);
lights();

pushMatrix();
translate(130, height/2, 0);
rotateY(1.25);
rotateX(-0.4);
noStroke();
box(100);
popMatrix();

pushMatrix();
translate(500, height*0.35, -200);
noFill();
stroke(255);
sphere(280);
popMatrix();
