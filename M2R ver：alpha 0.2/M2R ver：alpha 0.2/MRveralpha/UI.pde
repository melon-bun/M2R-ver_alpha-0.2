class UI {
  float LeftX;
  float LeftY;
  float LeftLength;
  float LeftHeight;
  float DiagramX;
  float DiagramY;
  float DiagramLength;
  float DiagramHeight;

  UI() {
    LeftX=width/2+30;
    LeftY=0;
    LeftLength=width/2-30;
    LeftHeight=height;
    DiagramX=width/2+34;
    DiagramY=38;
    DiagramLength=width/2-36;
    DiagramHeight=248;
  }

  void display() {
    rectMode(CORNER);
    noStroke();
    fill(43, 44, 46);
    rect(LeftX, LeftY, LeftLength, LeftHeight);
    strokeWeight(0.25);
    stroke(10);
    fill(35,37,37);
    rect(DiagramX,DiagramY,DiagramLength,DiagramHeight);
    
    
  }
}

