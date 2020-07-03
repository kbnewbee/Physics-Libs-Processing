import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

ArrayList<Box> boxes; 
ArrayList<Bars> bars;

Box2DProcessing box2d; 

ArrayList<Particle> particles;

void setup() {
  size(600, 400);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  box2d.listenForCollisions();

  boxes = new ArrayList<Box>();
  bars = new ArrayList<Bars>();

  bars.add(new Bars(new PVector(width/2, 370)));

  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);

  box2d.step();

  if (random(1) < 0.1) {
    float sz = random(4, 8);
    particles.add(new Particle(random(width), 20, sz));
  }

  if (random(1) < 0.1) {
    boxes.add(new Box(new PVector(random(width), 20)));
  }

  //if (mousePressed) {
  //for (int i = 0; i< 2; i++) {
  //Box b = new Box(new PVector(random(width), 0));
  //boxes.add(b);
  //}
  for (Box bb : boxes) {
    bb.display();
  }
  for (Bars wall : bars) {
    wall.display();
  }

  //for (int i = particles.size()-1; i >= 0; i--) {
  //  Particle p = particles.get(i);
  //  p.display();
  //  // Particles that leave the screen, we delete them
  //  // (note they have to be deleted from both the box2d world and our list
  //  if (p.done()) {
  //    particles.remove(i);
  //  }
  //}
}

void beginContact(Contact cp) {

  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Box.class && o2.getClass() == Box.class) {
    Box bb1 = (Box) o1;
    bb1.change();
    Box bb2 = (Box) o2;
    bb2.change();
  }
  //if (o1.getClass() == Particle.class && o2.getClass() == Particle.class) {
  //  Particle p1 = (Particle) o1;
  //  p1.change();
  //  Particle p2 = (Particle) o2;
  //  p2.change();
  //}
}

void endContact(Contact cp) {
}

void keyPressed() {
  for (Box b : boxes) {
    Vec2 wind = new Vec2(200, 0);
    b.applyForce(wind);
  }
}
