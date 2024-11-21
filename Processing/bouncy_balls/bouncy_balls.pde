import java.util.Random; // import random
Random rand = new Random(); 
float boxsize; //size of frame the Poss bounce around
float x,y,z,rx,ry,rz,rr,rg,rb;
int count;
Pvector ball;
Pvector velo;
Pvector[] Pos;
Pvector[] Velos;


void setup() {
float rx = random(-20,20);
float ry = random(-20,20);
float rz = random(-20,20);
float rr = random(255);
float rg = random(255);
float rb = random(255);

ball = new Pvector(200,200,0);
velo = new Pvector(10,5,3);
count = 50; // number of balls
Pos = new Pvector[count]; // create array of positions
Velos = new Pvector[count]; // create array of velocites

for (int i =0; i < count; i++){
  Pos[i] = new Pvector(20,20,20);
  Velos[i] = new Pvector(rx,ry,rz);
  rx = random(-20,20);
  ry = random(-20,20);
  rz = random(-20,20);
  // create ballswith random velocities
  
  
  
}
  size(800,800,P3D);
  background(rr,rg,rb);
  lights();
  x = width/2;
  y = height/2;
  z = 0;
  boxsize =450;
}

void draw() {
rr = random(255);
rg = random(255);
rb = random(255);
  background(0,0,255);
  translate(400,400,0);
  
  pushMatrix();
  stroke(rr,rg,rb);
  noFill();
  translate(0, 0, 0);
  box(boxsize);
  popMatrix();
  
  for ( int i =0; i<count; i++){
    Pos[i].display();
    Pos[i].add(Velos[i]);
    

  
  if ((Pos[i].x > boxsize/2) || Pos[i].x < -1*(boxsize/2)){
    Velos[i].x = Velos[i].x * -1;
  }
  if ((Pos[i].y > boxsize/2) || Pos[i].y < -1*(boxsize/2)){
    Velos[i].y = Velos[i].y * -1;
  }
  if ((Pos[i].z > 0.9*boxsize/2) || Pos[i].z < -0.9*(boxsize/2)) {
    Velos[i].z = Velos[i].z * -1;
}

}
}
