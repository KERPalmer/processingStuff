class Pvector{
  float x;
  float y;
  float z;
  float rr;
  float rg;
  float rb;
  Pvector(float x_, float y_, float z_){
    x = x_;
    y = y_;
    z = z_;
    rr = random(255);
    rg = random(255);
    rb = random(255);
  }
  void add(Pvector v){
    x = x + v.x;
    y = y + v.y;
    z = z + v.z;
  }
  void take(Pvector v){
    x = x - v.x;
    y = y - v.y;
    z = z - v.z;
  }
  void display(){
    pushMatrix();
    translate(x,y,z);
    rr = random(255);
    rg = random(255);
    rb = random(255);
    stroke(rr,rg,rb);
    sphere(5);
    popMatrix();
  }
}
