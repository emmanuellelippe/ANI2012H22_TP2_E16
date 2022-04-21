//Initialisation des variables
String state= "Accueil"; 
//accueil
void setup()
{
  size(600, 800);
  setupJSON();
  setupEcranAccueil();
  setupEcran1();
  setupEcran2();
  setupEcran3();
  setupEcran3B();
  setupEcran4();
}

void draw()
{
  switch (state)
  {
    case "Accueil":
      drawEcranAccueil();
      break;
    case "Ecran1":
      drawEcran1();
      break;
    case "Ecran2":
      drawEcran2();
      break;
    case "Ecran3":
      drawEcran3();
      break;
    case "Ecran3B":
      drawEcran3B();
      break;
    case "Ecran4":
      drawEcran4();
      break;
  }
}

void keyPressed(){
keyPressedEcran1();
keyPressedEcran2();
keyPressedEcran3();
keyPressedEcran3B();

}

void mousePressed() {
mousePressedEcran1();
mousePressedEcran2();
mousePressedEcran3B();
}
