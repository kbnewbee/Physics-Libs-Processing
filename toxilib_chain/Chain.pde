class Chain {
  float totallen;
  int numPoints;
  float stren;
  float radius;

  ArrayList<Particle> particles;

  Particle tail;
  PVector offset = new PVector();
  boolean dragged = false;

  Chain(float totallen, int numPoints, float stren, float radius) {
    this.totallen = totallen;
    this.numPoints = numPoints;
    this.stren = stren;
    this.radius = radius;

    particles = new ArrayList<Particle>();

    float len = totallen/numPoints;

    for (int i =0; i < numPoints; i++) {
      Particle p = new Particle(new Vec2D(width/2, i*len));
      physics.addParticle(p);
      particles.add(p);

      if (i != 0) {
        Particle prev = particles.get(i-1);
        VerletSpring2D spring = new VerletSpring2D(p, prev, len, stren);
        physics.addSpring(spring);
      }
    }

    Particle head =particles.get(0);
    head.lock();

    tail = particles.get(numPoints-1);
    tail.radius = radius;
  }

  void contains(float x, float y) {
    float d = dist(x, y, tail.x, tail.y);
    if (d < radius) {
      offset.x = tail.x - x;
      offset.y = tail.y - y;
      tail.lock();
      dragged = true;
    }
  }

  void release() {
    tail.unlock();
    dragged = false;
  }

  void update(float x, float y) {
    if (dragged) {
      tail.set(offset.x + x, offset.y + y);
    }
  }

  void display() {
    beginShape();
    stroke(0);
    strokeWeight(1);
    noFill();
    for (Particle p : particles) {
      vertex(p.x, p.y);
    }
    endShape();
    tail.display();
  }
}
