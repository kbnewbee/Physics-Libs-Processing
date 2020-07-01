import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 

ArrayList<Box> boxes; 
ArrayList<Bars> bars;

Box2DProcessing box2d; 

void setup() {
  size(600, 400);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  boxes = new ArrayList<Box>();
  bars = new ArrayList<Bars>();

  bars.add(new Bars(new PVector(100, 370)));
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
  for (Bars wall : bars) {
    wall.display();
  }
}
