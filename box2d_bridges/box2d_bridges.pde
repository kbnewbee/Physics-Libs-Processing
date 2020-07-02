import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

ArrayList<Box> boxes; 
Bridge bridge;

Box2DProcessing box2d; 

void setup() {
  size(600, 400);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  bridge = new Bridge(width/20);

  boxes = new ArrayList<Box>();
}

void draw() {
  background(255);
  box2d.step();

  if (mousePressed) {
    Box b = new Box(new PVector(mouseX, mouseY));
    boxes.add(b);
  }  

  for (Box b : boxes) {
    b.display();
  }

  bridge.display();
}
