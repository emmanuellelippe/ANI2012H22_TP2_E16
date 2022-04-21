ParticleSystem ps;
int countParticle=0;



void setupEcran4() {
  textFont (font);
  smooth();
  noStroke();
  ps = new ParticleSystem(new PVector(width/1, 00));
}


void drawEcran4() {
  background(#20E9F2);
   noStroke();
  countParticle++;
  if (countParticle%4 == 0) {
    ps.addParticle();
  }
  ps.run();
  
noStroke();
//soleil
  fill(#F2F220);
  ellipse(-75, -75, 300, 280);
  
   ellipseMode(CENTER);
   
  //Collines
  
  fill(#678673); //vert pâle
  arc(311, 770, 1100, 570, PI, TWO_PI);

  fill(#551B10); //rouge brun
  arc (381, 800, 888, 490, PI, TWO_PI);
  
//Petites mottes de terre

  //Motte 1: 
  fill(#892E1E);
  arc(135, 742, 120, 50, PI, TWO_PI);

  fill(#794E47);
  arc(138, 730, 60, 20, PI, TWO_PI);
  
  //Motte 2:
  fill(#892E1E);
  arc(410, 686, 120, 50, PI, TWO_PI);

  fill(#794E47);
  arc(414, 674, 60, 20, PI, TWO_PI);
  
  //mottes de terre 2e plan:
  
  //Motte3
  fill(#892E1E);
  arc(240, 590, 120, 50, PI, TWO_PI);

  fill(#794E47);
  arc(243, 578, 60, 20, PI, TWO_PI);
  
  //Fleur 1
   fill(#296C0D);
  rect(137, 630, 10, 90);
  float angle = PI/10;
  for (float i=angle*5; i<angle*16; i=i+angle) {
    drawPetale(flower, 141, 629, 17, 75, i);
  }
  //Fleur 2
  fill(#296C0D);
  rect(412, 576, 10, 90);
  float angle2 = PI/10;
  for (float i=angle2*5; i<angle2*16; i=i+angle2) {
    drawPetale(flower, 418, 574, 17, 75, i);
  }
  //Fleur3
   fill(#296C0D);
  rect(240,479,10,90);
  float angle3 = PI/10;
  for (float i=angle3*5; i<angle3*16; i=i+angle3) {
    drawPetale(flower, 245, 482, 17, 75, i);
    
    fill (#F0BE33); //orange 
  textFont (font1);
  text ( "Cherche le mot photosynthèse", 245, 745);
  }
}
