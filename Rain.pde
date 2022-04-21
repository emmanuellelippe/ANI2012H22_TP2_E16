class Rain {
  float r = random(800);
  float y = random(-height);

  void fall() {
    y = y + 7;
    fill(10,214,255,200);
    ellipse(r, y, 5, 5);

   if(y>height){
   r = random(600);
   y = random(-200);
   }

  }
}
