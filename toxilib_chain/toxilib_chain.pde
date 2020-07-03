import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
Chain chain;
ArrayList<Particle> particles;

float w = 10; 

void setup() {
  size(600, 400);

  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.1)));
  physics.setWorldBounds(new Rect(0, 0, width, height));

  chain = new Chain(100, 20, 0.1, 15);

  particles = new ArrayList<Particle>();
  float x =100;
  float y =10;
  for (int i= 0; i<40; i++) {
    Particle p = new Particle(new Vec2D(x, y));
    particles.add(p);
    x = x+w;
  }
}
void draw() {
  background(255);
  physics.update();
  chain.update(mouseX, mouseY);
  chain.display();


  for (Particle p : particles) {
    p.display();
  }
}

void mousePressed() {
  chain.contains(mouseX, mouseY);
}

void mouseReleased() {
  chain.release();
}
