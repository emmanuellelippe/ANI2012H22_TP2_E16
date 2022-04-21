class orangeParticle extends Particle{
  

 orangeParticle (PVector l){
   super(l);
 }
 
  // Visuel
  void display() {
    stroke(#F0BE33, lifespan);
    fill(100, lifespan);
    strokeWeight(2);
    line(position.x, position.y, -20, -10);
    strokeWeight(1);
  }

}
