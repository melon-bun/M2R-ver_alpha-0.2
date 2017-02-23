class Colorblock {
  color Bcolor;
  float positionX;
  float positionY;
  float rectlength=18;
  float FontY=78;
  float FontX=85;
  float scaleX=22;
  float scaleY=-22;
  float TranslateX=435;
  float TranslateY=250;
  String Hue;
  float Value;
  float Chroma;
  Colorblock(color tempC, String i, float x, float y) {
    Bcolor=tempC;
    positionX=x*scaleX;
    positionY=y*scaleY;
    Hue=i;
    Value=y+1;
    Chroma=2*(x+1);
  }
  void display() {
    rectMode(CENTER);
    noLights();   
    pushMatrix();
    translate(TranslateX, TranslateY);
    noStroke();
    //fill(2*red(Bcolor), 2*green(Bcolor), 2*blue(Bcolor));
    fill(red(Bcolor), green(Bcolor), blue(Bcolor));
    //println(red(Bcolor),green(Bcolor),blue(Bcolor))
    //for (int Start=TranslateX; Start<positionX; i++) {
    //}
    rect(positionX, positionY, rectlength, rectlength);
    popMatrix();
  }

  void mousePositionCheck() {
    rectMode(CENTER);
    pushMatrix();
    translate(TranslateX, TranslateY);
    if ((mouseX-TranslateX)<positionX+rectlength/2&&
      (mouseX-TranslateX)>positionX-rectlength/2&&
      (mouseY-TranslateY)<positionY+rectlength/2&&
      (mouseY-TranslateY)>positionY-rectlength/2) {
      //println(red(Bcolor), green(Bcolor), blue(Bcolor));
      textSize(18);
      fill(170, 170, 170);    
      text(int(red(Bcolor)), FontX+60, FontY+0);      
      text(int(green(Bcolor)), FontX+60, FontY+20);      
      text(int(blue(Bcolor)), FontX+60, FontY+40);      
      text(Hue, FontX-45, FontY+0);      
      text(int(Value), FontX-45, FontY+20);     
      text(int(Chroma), FontX-45, FontY+40);
    }
    popMatrix();
  }
}

