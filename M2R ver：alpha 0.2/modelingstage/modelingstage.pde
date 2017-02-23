float rotx=0;
float roty=0;
int DOF=-50;
int DOFmax=270;
int DOFmin=-50;
PVector origenXaxis;
PVector changeXaxis;
PShape munsell;
void setup() {
  size(700, 420, P3D);
  munsell = loadShape("sp.obj");
}

void draw() {
  stroke(0);
  background(255);
  lights();
  translate(width/2, height/2, DOF);
  pushMatrix();
  translate(0,0,0);
  rotateX(PI/2-rotx);
  //rotateY(PI/2-roty);
  changeXaxis = new PVector(1,0,0);
  stroke(255,0,0);
  line(0, 0, 0, 500, 0, 0);
  //line(0, 0, 0, 0, -200, 0);
  //line(0, 0, 0, 0, 0, 500);
  popMatrix();
  rotateX(rotx);
  rotateY(roty);
  stroke(0);
  box(50);
  shape(munsell);
  //println(DOF);
  coords();
}

void mouseDragged() {
  float rate=-0.02;
  rotx+=(pmouseY-mouseY)*-rate;
  roty+=(pmouseX-mouseX)*rate;
}

void keyPressed() {
  if (DOF<=DOFmax) {
    if (key=='z') {
      DOF+=10;
    }
  }
  if (DOF>=DOFmin) {
    if (key=='x') {
      DOF-=10;
    }
  }
}

void coords() {
  stroke(0);
  line(0, 0, 0, 500, 0, 0);
  line(0, 0, 0, 0, -200, 0);
  line(0, 0, 0, 0, 0, 500);
  //return
}
//Vectors()
