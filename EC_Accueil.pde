
import java.util.TreeMap;

//Gestion du temps
float timeNow;
float timeLast;
float timeElapsed;

//Ligne du temps
float timelinePlayhead;
float timelineDuration;

//Courbe d'animation
AnimationClip animationClip;
AnimationClip animationClipCiel;
float attributePositionX;
float attributePositionY;
float attributeRotation;
color attributeCouleurR, attributeCouleurG, attributeCouleurB;
color attributeCouleurRCiel, attributeCouleurGCiel, attributeCouleurBCiel;

//Séquencer
Sequencer sequencer;
Sequencer sequencerCiel;

int idxPhoto;
boolean modeDessin;

PImage lake;

void setupEcranAccueil() {
  
  
  //Gestion du temps
  timeNow = timeLast = timeElapsed = 0.0f;
  
  //Ligne du temps
  timelinePlayhead = 0.0f;
  timelineDuration = 10.0f;
  
  //Création du clip d'animation
  animationClip = new AnimationClip();
  animationClipCiel = new AnimationClip();
  
  //Séquenceur
  sequencer = new Sequencer();
  sequencerCiel = new Sequencer();
  
  //Lier le clip d'animation au séquenceur
  sequencer.clip = animationClip;
  sequencerCiel.clip = animationClipCiel;
  
  //Ajout des poses clés
  ajouterPosesClees();
    
  idxPhoto = 1;
  modeDessin = false;
  
  lake=loadImage ("lake.png");
}

void drawEcranAccueil() {
  
  //Dessin du background 
  
  background(attributeCouleurRCiel, attributeCouleurGCiel, attributeCouleurBCiel);
  
  fill(#678673);
  arc(311, 770, 1300, 570, PI, TWO_PI);

  fill(#551B10);
  arc (381, 770, 888, 290, PI, TWO_PI);
  
  tint(#49595A);
  image(lake,0,730);
  
  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f;
  timeLast = timeNow;
  
  //Mise à jour de la ligne du temps
  updateTimeline();
  
  //Mise  à jour de l'animation
  if (timelinePlayhead < timelineDuration)
  {
    updateAnimation();
    
  }
  else{
  state="Ecran1";
  }
}

//Fonction pour mettre à jour la ligne du temps
void updateTimeline() {
  
  // mettre à jour la position de la tête de lecture sur la ligne du temps
  if (timelinePlayhead < timelineDuration)
  {
    timelinePlayhead += timeElapsed;
  }
}

//Fonction qui met à jour l'animation
void updateAnimation() {
  
  //Mise à jour du séquenceur
  sequencer.update(timelinePlayhead);
  sequencerCiel.update(timelinePlayhead);
  
  attributePositionX = sequencer.attributeCurrentValuePositionX;
  attributePositionY = sequencer.attributeCurrentValuePositionY;
  attributeRotation  = sequencer.attributeCurrentValueRotation;
  attributeCouleurR   = sequencer.attributeCurrentValueCouleurR;
  attributeCouleurG   = sequencer.attributeCurrentValueCouleurG;
  attributeCouleurB   = sequencer.attributeCurrentValueCouleurB;
  
  //Couleur background
  attributeCouleurRCiel   = sequencerCiel.attributeCurrentValueCouleurR;
  attributeCouleurGCiel   = sequencerCiel.attributeCurrentValueCouleurG;
  attributeCouleurBCiel   = sequencerCiel.attributeCurrentValueCouleurB;
  
  //Dessin du nuage
  noStroke();
  fill( attributeCouleurR, attributeCouleurG, attributeCouleurB);
  pushMatrix();
  translate( attributePositionX, attributePositionY); 
  rotate( attributeRotation);
  cloudObject();
  popMatrix(); 
  
}

void ajouterPosesClees() {
  
  //PositionX
  animationClip.curveCollection.get("positionX").addKeyframe( 0.0f, -100.0f+nuagex);
  animationClip.curveCollection.get("positionX").addKeyframe( 10.0f, width + 200.0f+nuagex);
  
  //PositionY
  animationClip.curveCollection.get("positionY").addKeyframe( 0.0f, 300.0f+nuagey);
  animationClip.curveCollection.get("positionY").addKeyframe( 2.5f, 230.0f+nuagey);
  animationClip.curveCollection.get("positionY").addKeyframe( 5.0f, 380.0f+nuagey);
  animationClip.curveCollection.get("positionY").addKeyframe( 7.5f, 220.0f+nuagey);
  animationClip.curveCollection.get("positionY").addKeyframe( 10.0f,300.0f+nuagey);
  
    
  //Couleur nuage
  //Rouge
  animationClip.curveCollection.get("couleurR").addKeyframe( 0.0f, 255);
  animationClip.curveCollection.get("couleurR").addKeyframe( 10.0f, 50);
  //Vert
  animationClip.curveCollection.get("couleurG").addKeyframe( 0.0f, 255);
  animationClip.curveCollection.get("couleurG").addKeyframe( 10.0f, 50);
  //Bleu
  animationClip.curveCollection.get("couleurB").addKeyframe( 0.0f, 255);
  animationClip.curveCollection.get("couleurB").addKeyframe( 10.0f, 50);  
  
  
  //Couleur Ciel 42, 198, 194 => 12, 77, 76
  //Rouge
  animationClipCiel.curveCollection.get("couleurR").addKeyframe( 0.0f, 42);
  animationClipCiel.curveCollection.get("couleurR").addKeyframe( 10.0f, 12);
  //Vert
  animationClipCiel.curveCollection.get("couleurG").addKeyframe( 0.0f, 198);
  animationClipCiel.curveCollection.get("couleurG").addKeyframe( 10.0f, 77);
  //Bleu
  animationClipCiel.curveCollection.get("couleurB").addKeyframe( 0.0f, 194);
  animationClipCiel.curveCollection.get("couleurB").addKeyframe( 10.0f, 76);  
}

void cloudObject(){
  float x = 130, y=190;
  
  //Premier nuage
  beginShape();
  vertex(50-x, 180-y);
  bezierVertex(50-x, 150-y, 80-x, 120-y, 132-x, 150-y);
  bezierVertex(150-x, 115-y, 210-x, 135-y, 200-x, 160-y);
  bezierVertex(270-x, 175-y, 230-x, 235-y, 170-x, 220-y);
  bezierVertex(170-x, 250-y, 80-x, 255-y, 70-x, 220-y);
  bezierVertex(20-x, 240-y, 25-x, 170-y, 50-x, 180-y);
  endShape();
  
  
  //Deuxième nuage
  x=x+100;
  y=y+100;
  beginShape();
  vertex(50-x, 180-y);
  bezierVertex(50-x, 150-y, 80-x, 120-y, 132-x, 150-y);
  bezierVertex(150-x, 115-y, 210-x, 135-y, 200-x, 160-y);
  bezierVertex(270-x, 175-y, 230-x, 235-y, 170-x, 220-y);
  bezierVertex(170-x, 250-y, 80-x, 255-y, 70-x, 220-y);
  bezierVertex(20-x, 240-y, 25-x, 170-y, 50-x, 180-y);
  endShape();

}
