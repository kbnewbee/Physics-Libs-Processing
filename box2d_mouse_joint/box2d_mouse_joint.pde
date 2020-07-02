import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d; 
ArrayList<Boundary> bds;
Box box;
Spring spring;

void setup() {
  size(600, 600);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  bds = new ArrayList<Boundary>();
  bds.add(new Boundary(new PVector(width/2, 0), false));
  bds.add(new Boundary(new PVector(width, height/2), true));  
  bds.add(new Boundary(new PVector(width/2, height), false));
  bds.add(new Boundary(new PVector(0, height/2), true));

  box = new Box(new PVector(width/2, height/2));
  spring = new Spring();
}
void draw() {
  background(255);
  box2d.step();
  spring.update(mouseX, mouseY);

  for (Boundary bd : bds) {
    bd.display();
  }

  box.display();


  spring.display();
}

void mousePressed() {
  if (box.contains(new PVector(mouseX, mouseY))) {
    spring.bind(new PVector(mouseX, mouseY), box);
  }
}

void mouseReleased() {
  spring.destroy();
}
