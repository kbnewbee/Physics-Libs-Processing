import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 

ArrayList<Custom> boxes; 
Box2DProcessing box2d; 

void setup() {
  size(600, 400);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxes = new ArrayList<Custom>();
}

void draw() {
  background(255);
  
  box2d.step();
  
  if (mousePressed) {
    Custom b = new Custom(new PVector(mouseX, mouseY));
    boxes.add(b);
  }
  for (Custom b : boxes) {
    b.display();
  }
}
