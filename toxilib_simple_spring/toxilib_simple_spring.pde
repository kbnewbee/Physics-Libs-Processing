import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;

Particle p1;
Particle p2;
Particle p3;
Particle p4;
Particle p5;

void setup() {
  size(600, 400);

  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));

  physics.setWorldBounds(new Rect(0, 0, width, height));

  p1 = new Particle(new Vec2D(width/2, 20));
  p2 = new Particle(new Vec2D(width/2+160, 20));
  p3 = new Particle(new Vec2D(width/2, height-20));
  p4 = new Particle(new Vec2D(20, height/2));
  p5 = new Particle(new Vec2D(width-20, height/2));

  p1.lock();
  p3.lock();
  p4.lock();
  p5.lock();

  VerletSpring2D spring = new VerletSpring2D(p1, p2, 160, 0.001);
  VerletSpring2D spring1 = new VerletSpring2D(p3, p2, 160, 0.001);
  VerletSpring2D spring2 = new VerletSpring2D(p4, p2, 160, 0.001);
  VerletSpring2D spring3 = new VerletSpring2D(p5, p2, 160, 0.001);

  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addParticle(p3);
  physics.addParticle(p4);
  physics.addParticle(p5);
  physics.addSpring(spring);
  physics.addSpring(spring1);
  physics.addSpring(spring2);
  physics.addSpring(spring3);
}

void draw() {
  background(255);
  physics.update();
  stroke(0);
  line(p1.x, p1.y, p2.x, p2.y);
  line(p5.x, p5.y, p2.x, p2.y);
  line(p3.x, p3.y, p2.x, p2.y);
  line(p4.x, p4.y, p2.x, p2.y);

  //p1.display();
  p2.display();
  //p3.display();
  //p4.display();
  //p5.display();

  if (mousePressed) {
    p2.lock();
    p2.x = mouseX;
    p2.y = mouseY;
    p2.unlock();
  }
}
