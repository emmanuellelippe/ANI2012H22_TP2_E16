Button button6 = new Button(50, 100, 40, 40, #37ADB7, #3A858B, #397E68, false);
ArrayList<String> path = new ArrayList<String>();
int it = 0, maxIt = 10, rep=0;
float cx = 300, cy = 550, x, y, x2, y2, l = 50, ld = 0.9, rot=-PI/2, spin = PI/6;

boolean fileLoopPapillon=true;
//structure pissenlit en graine
boolean structure=false;
//background couleur
boolean fond=true;

import processing.sound.*;
SoundFile file_Papillon;


void setupEcran3B() {
  for (int i = 0; i < pow(2, maxIt); i++) {
    String a = loadZeros(int(binary(i)), maxIt);
    path.add(a);
  }

  file_Papillon = new SoundFile(this, "Papillon.mp3");
}

void drawEcran3B() {
  if (fond) {
    background(#25CECA);
    stroke(#5F6262);
    strokeWeight(8);
    line(cx, cy, cx, cy-l);

    //loupe
    fill(#FCFCE3);
    ellipse (300, 415, 585, 585);

    //texte
    textFont (font1);
    fill(#272F64);
    text ("Veux-tu voir de plus près la structure ", 25, 35);
    text (" d'un pissenlit en graine?", 25, 65);
    text ("appuie sur l pour loupe", 25, 745);

    fond=false;
  }

  if (structure) {
    if (fileLoopPapillon) {
      file_Papillon.play();
      fileLoopPapillon=false;
    }

    String load = path.get(rep);
    float crot = rot, cl = l, x = cx, y = cy, x2=x, y2=y;
    strokeWeight(8);
   stroke(#5F6262);
    for (int i = 0; i < maxIt; i++) {
      strokeWeight(8/pow(2, i));
      x+=cos(crot)*cl;
      y+=sin(crot)*cl;
      cl*=ld;
      crot+=spin*((int(load.charAt(i))*2-1));
      line(x, y, x2, y2);
      x2 = x;
      y2 = y;
    }
    rep++;
    if (rep == pow(2, maxIt)) {
      noLoop();
    }
  }
  strokeWeight(2);
  button6.draw_button();
  fill (#1D2E67);
  text ("6", 62, 129);
}

String loadZeros(int number, int len) {
  if ((number+"").length() < len) {
    String prefix = "";
    for (int i = 0; i < len-(number+"").length(); i++) {
      prefix += "0";
    }
    return(prefix + number);
  } else {
    return(number+"");
  }
}

void keyPressedEcran3B() {
  if (key=='l') {
    structure=true;
  }
}

void mousePressedEcran3B() {
  if (button6.over) {
    file_Papillon.stop();
    state = "Ecran4";
    button6.over = false;
  }
}
