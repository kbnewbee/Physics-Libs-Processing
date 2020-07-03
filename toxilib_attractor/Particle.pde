class Particle extends VerletParticle2D {
  float radius = 2;

  Particle(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior2D(this,radius*4, -0.1));
  }

  void display() {
    fill(255,0,0);
    stroke(0);
    ellipse(x, y, radius*2, radius*2);
  }
}
