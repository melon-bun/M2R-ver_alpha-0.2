float rotx=0;
float roty=0;
int DOF=15;
int DOFmax=270;
int DOFmin=-50;
PVector origenXaxis;
PVector changeXaxis;
PShape munsell;
float Degree;
color [][][]iro = new color[40][9][12];
String []Hue =new String[40];
Table table;
Colorblock blocks;
Label label;
UI ui;
float Angleshifting=0;
PFont f;
float Angle=9;
float TranslateX=435;
float TranslateY=250;
String temphue;
void setup() {
  size(680, 400, P3D);
  f=loadFont("BankGothicBT-Light-48.vlw");
  munsell = loadShape("sp.obj");
  loadDate();
  rectMode(CENTER);
  label=new Label();
  ui=new UI();
}
void draw() {
  stroke(0);
  background(24, 24, 25);
  ui.display();
  cy();
  label.display();
  lights();
  pushMatrix();
  translate(215, height/2+35, DOF);
  //camera(-200, 0, (height/2.0) / tan(PI*30.0 / 180.0), 
  //0, 0, 0, 0, 1, 0);
  rotateX(PI/2);
  //rotateX(constrain(rotx,-0.15,0.12));
  rotateZ(roty);
  stroke(0);
  fill(255);
  //box(50);
  shape(munsell);
  //println(DOF);
  //coords();
  popMatrix();
  Degree=degree(roty, Angleshifting);
  for (int j=0; j<iro[0].length; j++) {
    for (int k=0; k<iro[0][0].length; k++) {
      if (iro[int(Degree/Angle)][j][k]!=0) {
        blocks = new Colorblock(iro[int(Degree/Angle)][j][k], Hue[int(Degree/Angle)], k, j);
        blocks.display();
        blocks.mousePositionCheck();
        //println(iro[int(Degree/Angle)][j][k]);
      }
    }
  }
  //println(degrees(rotx), "+", degrees(roty));//propmt
  println(Degree);
}

void mouseDragged() {
  float rate=-0.02;
  if (mouseX<width/2) {
    rotx+=(pmouseY-mouseY)*-rate;
    roty+=(pmouseX-mouseX)*-rate;
  }
}

float degree(float cumulateY, float angel) {
  float n = degrees(cumulateY)+angel;
  cumulateY=n-int(n/360)*360;
  if (n<0) {
    cumulateY = n+360*int(abs(n/360)+1);
  }
  return cumulateY;
}

/*void keyPressed() {
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
 }*/

/*void coords() {
 stroke(0);
 stroke(255, 0, 0);
 line(0, 0, 0, 500, 0, 0);
 stroke(0, 255, 0);
 line(0, 0, 0, 0, 200, 0);
 stroke(0, 0, 255);
 line(0, 0, 0, 0, 0, 500);
 }*/

void cy() {
  rectMode(CENTER);
  pushMatrix();
  translate(TranslateX, TranslateY);
  noStroke();
  fill(0);
  rect(-25, 22, 18, 18);
  fill(34);
  rect(-25, 0, 18, 18);
  fill(52);
  rect(-25, -22, 18, 18);
  fill(73);
  rect(-25, -44, 18, 18);
  fill(97);
  rect(-25, -66, 18, 18);
  fill(121);
  rect(-25, -88, 18, 18);
  fill(147);
  rect(-25, -110, 18, 18);
  fill(173);
  rect(-25, -132, 18, 18);
  fill(200);
  rect(-25, -154, 18, 18);
  fill(228);
  rect(-25, -176, 18, 18);
  fill(255);
  rect(-25, -198, 18, 18);
  popMatrix();
}


void loadDate() {//input the data
  table=loadTable("M2R.csv", "header");
  int rowCount=0;
  for (TableRow row : table.rows ()) {
    int chroma=int(row.getFloat("Chroma"));
    int value=int(row.getFloat("Value"));
    int angle=int(row.getFloat("Angle"));
    int r=int(row.getFloat("R"));
    int g=int(row.getFloat("G"));
    int b=int(row.getFloat("B"));
    iro[int(angle/Angle)][value-1][(chroma-2)/2]=color(r, g, b);
    String hue = row.getString("Hue");
    if (hue!=temphue) {
      Hue[int(angle/Angle)]=hue;
    }
    String temphue = hue;
  }
}

