import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d; 
ArrayList<Box> boxes;
Joint joint;

void setup() {
  size(600, 400);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  joint = new Joint(new PVector(width/2, 2*height/3));
  boxes = new ArrayList<Box>();
}

void draw() {

  background(255);
  box2d.step();

  if (random(1) < 0.1) {
    Box b = new Box(new PVector(width/2, 0));
    boxes.add(b);
  }

  joint.display();

  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    b.display();

    if (b.done()) {
      boxes.remove(i);
    }
  }
}

void mousePressed() {
  joint.toggleMotor();
}
