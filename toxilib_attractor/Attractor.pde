class Attractor extends VerletParticle2D {
  float radius = 30;

  Attractor(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior2D(this, width, 1));
  }

  void display() {
    fill(127, 64);
    stroke(0);
    ellipse(x, y, radius*2, radius*2);
  }
}
