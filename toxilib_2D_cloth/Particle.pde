class Particle extends VerletParticle2D {

  Particle(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
  }

  void display() {
    fill(255);
    ellipse(x, y, 10, 10);
  }
}
