class Label {
  float TranslateX=435;
  float TranslateY=250;
  float FontY=78;
  float FontX=125;

  Label() {
  }

  void display() {
    noLights();   
    pushMatrix();
    translate(TranslateX, TranslateY);
    noStroke();
    textSize(18);
    fill(170, 170, 170);
    text("R: ", FontX, FontY+0);
    text("G: ", FontX, FontY+20);
    text("B: ", FontX, FontY+40);
    text("Hue: ", FontX-160, FontY+0);
    text("Value: ", FontX-160, FontY+20);
    text("Chroma: ", FontX-160, FontY+40);
    popMatrix();
    noStroke();
    textSize(10);
    fill(170, 170, 170);
    text("M2R Ver (Alpha 0.2)",8,392);
  }
}

