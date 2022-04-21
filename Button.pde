class Button {
  int x, y, sizex, sizey;
  boolean over;
  color defaultColor, overColor, strokeColor;

  Button (int x, int y, int sizex, int sizey, color defaultColor, color overColor, color strokeColor, boolean over)
  {
    this.x = x;
    this.y = y;
    this.sizex = sizex;
    this.sizey = sizey;
    this.over = over;
    this.defaultColor = defaultColor;
    this.overColor = overColor;
    this.strokeColor = strokeColor;
  }
  void draw_button() {
    this.update();
    if (this.over) {

      fill(overColor);
    } else {
      fill(defaultColor);
    }
    stroke(strokeColor);
    rect(this.x, this.y, this.sizex, this.sizey, 24);
  }

  void update() {

    //Test du Over de bouton de retour
    if ( overButton(this.x, this.y, this.sizex, this.sizey)) {
      this.over = true;
    } else {
      this.over = false;
    }
  }

  boolean overButton(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}
