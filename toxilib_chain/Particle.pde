class Particle extends VerletParticle2D {

  float radius = 4;
  
  Particle(Vec2D loc) {
    super(loc);
  }

  void display() {
    fill(127);
    stroke(0);
    ellipse(x, y, radius*2, radius*2);
  }
}
