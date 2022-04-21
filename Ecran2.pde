Button button5 = new Button(50, 100, 40, 40, #37ADB7, #3A858B, #397E68, false);
Flock flock;

boolean flower2=false;


import processing.sound.*;
SoundFile file_insectes;

void setupEcran2() {
  
  file_insectes = new SoundFile(this, "insectes.mp3");
  
  textFont (font);
  smooth();
  noStroke();

  flock = new Flock();
}
//terrain
void drawEcran2() {
  background (#3FC0D8);
  noStroke();
  
  //soleil et lune
  int x=200;
  int y=560;
  int w=400;
  int h=400;

  if (sqrt(sq(x - mouseX) + sq(y - mouseY)) < w/2 && mousePressed) {
    soleil=true;
    if (soleil) {
     background (#122E34);
    } else {
     background (#3FC0D8);   
    }
  }
   //texte
  fill (#1D2E67); // bleu foncé foncé 
 
  textFont (font);
  text ("Les plantes poussent grâce à l'eau, au soleil", 25, 45);
  text ("et à la polénisation par les insectes", 25, 85);
  
  textFont (font1);
  text ("passe ta souris sur la motte de terre", 25, 225);
  text ("appuie sur la touche i pour insectes", 25, 275);
  
  //soleil
  fill(#F9FCAB);
  noStroke();
  ellipse(x, y, w, h);

  //collines
  ellipseMode(CENTER);
  fill(#678673); //vert pâle
  arc(311, 770, 1100, 570, PI, TWO_PI);

  fill(#551B10); //rouge brun
  arc (381, 800, 888, 490, PI, TWO_PI);

  //Construction de la fleur 1
  fill(#296C0D);
  rect(97, 612, 10, 100);
  float angle = PI/10;
  for (float i=angle*5; i<angle*16; i=i+angle) {
    drawPetale(flower, 102, 612, 17, 75, i);
  }

  if (flower2==true) {
    //Construction de la fleur 2
    fill(#296C0D);
    rect(460, 412, 16, 200);
    angle = PI/10;
    for (float i=angle*5; i<angle*16; i=i+angle) {
      drawPetale(flower, 464, 412, 25, 125, i);
    }
  }
  ellipseMode(CENTER);

 //petites mottes de terre

  fill(#892E1E);
  arc(100, 712, 120, 50, PI, TWO_PI);

  fill(#794E47);
  arc(102, 712, 60, 20, PI, TWO_PI);

  fill(#892E1E);
  arc(465, 612, 120, 50, PI, TWO_PI);

  fill(#794E47);
  arc(470, 612, 60, 20, PI, TWO_PI);
  
  flock.run();
  
if(mouseX>460 && mouseX<600 && mouseY>602 && mouseY<672){
  flower2=true;
}
 button5.draw_button();
  fill (#1D2E67);
  text ("5", 62, 129);
 }

void keyPressedEcran2() {
  if (key=='i') {
   
  file_insectes.play();
    //nombre d'oiseaux i
    for (int i = 0; i < 20; i++) {
      //4
      flock.addBoid(new Boid(-10, 360));
    }
  }
}

void mousePressedEcran2() {
  if (button5.over) {
    file_insectes.stop();
    state = "Ecran3";
    button5.over = false;
  }
}
