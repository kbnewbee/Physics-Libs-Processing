import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Particle> particles;
Attractor a;

void setup() {
  size(600, 400);

  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 10)));
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.setDrag (0.03);

  particles = new ArrayList<Particle>();
  for (int i = 0; i < 400; i++) {
    particles.add(new Particle(new Vec2D(random(200, 400), random(30))));
  }
  //a = new Attractor(new Vec2D(width/2, height/2));
  //a.lock();
}
void draw() {
  background(0);
  physics.update();

  for (Particle p : particles) {
    p.display();
  }
  //a.display();
}

void mousePressed() {
  a = new Attractor(new Vec2D(mouseX, mouseY));
}
