class  Joint {

  Box b1; 
  Box b2;
  float len;

  Joint(PVector l) {
    len = 30;
    b1 = new Box(l);
    b2 = new Box(new PVector(l.x + 10, l.y + 10));

    DistanceJointDef djd = new DistanceJointDef();
    djd.bodyA = b1.body;
    djd.bodyB = b2.body;
    djd.length = box2d.scalarPixelsToWorld(len);

    djd.frequencyHz = 3;
    djd.dampingRatio = 0.1;

    DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
  }

  void display() {
    Vec2 pos1 = box2d.getBodyPixelCoord(b1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(b2.body);

    stroke(0);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
    b1.display();
    b2.display();
  }
}
