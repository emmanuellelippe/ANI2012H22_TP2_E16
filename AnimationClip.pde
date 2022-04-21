class AnimationClip {
  
  //Dictionnaire de courbes d'animation
  TreeMap<String, AnimationCurve> curveCollection;
  
  AnimationClip() {
    //Création du dictionnaire
    curveCollection = new TreeMap<String, AnimationCurve>();
    
    //Ajout des courbes d'animation au dictionnaire
    curveCollection.put("positionX", new AnimationCurve("positionX"));
    curveCollection.put("positionY", new AnimationCurve("positionY"));
    curveCollection.put("rotation", new AnimationCurve("rotation"));
    curveCollection.put("couleurR", new AnimationCurve("couleur"));
    curveCollection.put("couleurG", new AnimationCurve("couleur"));
    curveCollection.put("couleurB", new AnimationCurve("couleur"));
  }
}
