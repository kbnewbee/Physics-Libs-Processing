import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

ArrayList<Box> boxes; 
ArrayList<Boundary> bars;
ArrayList<Joint> pairs;

Box2DProcessing box2d; 

void setup() {
  size(600, 400);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  boxes = new ArrayList<Box>();
  bars = new ArrayList<Boundary>();

  bars.add(new Boundary(new PVector(width/3, 370)));
  bars.add(new Boundary(new PVector(2*width/3, 270)));

  pairs = new ArrayList<Joint>();
}

void draw() {
  background(255);
  box2d.step();

  if (mousePressed) {
    Joint j = new Joint(new PVector(mouseX,mouseY));
    pairs.add(j);
  }  

  for (Joint p : pairs) {
    p.display();
  }

  for (Boundary wall : bars) {
    wall.display();
  }
}
