class  Joint {

  Material m1; 
  Material m2;
  float len;

  Joint(PVector l) {
    len = 20;
    //m1 = new Material(l);
    //m2 = new Material(new PVector(l.x + len, l.y));

    DistanceJointDef djd = new DistanceJointDef();
    djd.bodyA = m1.body;
    djd.bodyB = m2.body;
    djd.length = box2d.scalarPixelsToWorld(len);

    djd.frequencyHz = 3;
    djd.dampingRatio = 0.1;

    DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
  }

  void display() {
    Vec2 pos1 = box2d.getBodyPixelCoord(m1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(m2.body);

    stroke(0,64);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
    m1.display();
    m2.display();
  }
}
