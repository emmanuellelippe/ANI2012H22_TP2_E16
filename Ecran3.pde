
boolean movie=false;
import processing.video.*;
Movie myMovie;


void setupEcran3() {
   myMovie = new Movie(this, "Dandelion_timelapse.mov");
  
}

void drawEcran3() {
  noTint();
  background (#25CECA);
  noStroke();
  
   //soleil et lune
  int x=100;
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
   fill(#272F64);
  text ("Veux-tu voir un vrai pissenlit pousser?", 25, 45);
  
  textFont (font1);
  text ("appuie sur v pour voir la vidéo", 25, 85);
  
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
  
   //tint(255, 20);
   if (movie==true)
  image(myMovie, 380, 160,192,108);
 
  if (myMovie.time()>=33){
    movie=false;
    state="Ecran3B";
    
  }
}

void movieEvent(Movie m) {
  if (movie==true){
  m.read();
}
}
void keyPressedEcran3() {
  if (key=='v') {
    movie=true;
    myMovie.play();
  }
}
