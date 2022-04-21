Button button4 = new Button(50, 100, 40, 40, #37ADB7, #3A858B, #397E68, false);
boolean fileLoop=true;
boolean soleil=false;
PFont font;
PFont font1;

//Pluie

Rain r1;
int numDrops = 60;
Rain[] drops = new Rain[numDrops]; 
boolean makeRain=true;

import processing.sound.*;
SoundFile file_lightrain;

void setupEcran1() {
  lake=loadImage ("lake.png");
  font = loadFont ("MshtakanOblique-30.vlw");
  font1 = loadFont ("HiraginoSans-W2-20.vlw");
  textFont (font);
  smooth();
  noStroke();
  file_lightrain = new SoundFile(this, "Lightrain.wav");
  
  for (int i = 1; i < drops.length; i++) {

    drops[i] = new Rain(); 
    r1 = new Rain();
  }
}

void drawPetale(color PetaleColor, int posX, int posY, int largeur, int longueur, float angle) {

  pushMatrix();
  fill(PetaleColor);
  translate(posX, posY);
  rotate(angle);
  ellipseMode(CORNER);
  translate(-largeur/2, 0);
  ellipse(0, 0, largeur, longueur);
  popMatrix();
}

void drawEcran1() {
  if (fileLoop){
  file_lightrain.play();
  fileLoop=false;
  }
  background(12,77,76);
 fill (#53E2E5); // bleu pâle 
  //soleil et lune
  int x=400;
  int y=160;
  int w=600;
  int h=600;
if (sqrt(sq(x - mouseX) + sq(y - mouseY)) < w/2 && mousePressed) {
    soleil=true;
    if (soleil) {
     background (#3FC0D8); //bleu pâle jour
     fill(#0F327C);
    } else {
     background (12, 77, 76);  //bleu foncé pluie
      fill (#53E2E5); // bleu pâle 
    }
  }
   tint(#49595A);
  image(lake,0,460);
   //texte
 
  
  textFont (font);
  text ("La petite pousse est devenue pissenlit!", 25, 45);
   
  textFont (font1);
  text ("appuie sur la touche p pour arrêter la pluie", 25, 225);
  text ("clique sur le soleil", 25, 275);
  
  //soleil lune
  fill(#F9FCAB); //jaune
  noStroke();
  ellipse(x, y, w, h);

//colline brune
  fill (#641212);
  arc (0, 400, 1200, 870, PI, TWO_PI);
  
  //Construction de la fleur 1
  fill(#296C0D);
  rect(209, 622, 10, 90);
  float angle = PI/10;
  for (float i=angle*5; i<angle*16; i=i+angle) {
    drawPetale(flower, 211, 622, 17, 75, i);
  }
  //Fleur 2
  fill(#296C0D);
  rect(460, 568, 10, 90);
  float angle2 = PI/10;
  for (float i=angle2*5; i<angle2*16; i=i+angle2) {
    drawPetale(flower, 466, 568, 17, 75, i);
  }
  //Fleur3
   fill(#296C0D);
  rect(310,435,10,90);
  float angle3 = PI/10;
  for (float i=angle3*5; i<angle3*16; i=i+angle3) {
    drawPetale(flower, 315, 432, 17, 75, i);
  }
  
  //Loop through array to use objects.
  if(makeRain==true){
  for (int i = 1; i < drops.length; i++) {
    drops[i].fall();
    
  }
  }  else {
    file_lightrain.stop();
  } 
  //2 mottes de terre 1er plan:
  
  //Motte 1: 
  fill(#892E1E);
  arc(157, 712, 120, 50, PI, TWO_PI);

  fill(#794E47);
  arc(184, 712, 60, 20, PI, TWO_PI);
  
  //Motte 2:
  fill(#892E1E);
  arc(410, 656, 120, 50, PI, TWO_PI);

  fill(#794E47);
  arc(440, 656, 60, 20, PI, TWO_PI);
  
  //mottes de terre 2e plan:
  //Motte3
  fill(#892E1E);
  arc(260, 510, 120, 50, PI, TWO_PI);

  fill(#794E47);
  arc(289, 509, 60, 20, PI, TWO_PI);
  
  //Bouton partie 1
  button4.draw_button();
  fill (#1D2E67);
  text ("4", 62, 129);
  
}
void keyPressedEcran1(){
  if (key=='p'){
    makeRain=false;
  }
}
void mousePressedEcran1() {
  if (button4.over) {
    file_lightrain.stop();
    state = "Ecran2";
    button4.over = false;
  }
}
