class  Joint {

  Parts p1; 
  Parts p2;
  RevoluteJoint joint;

  Joint(PVector l) {

    p1 = new Parts(new PVector(l.x, l.y-25), 120, 10, false);
    p2 = new Parts(new PVector(l.x, l.y), 10, 50, true);

    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.initialize(p1.body, p2.body, p1.body.getWorldCenter());

    rjd.motorSpeed = TWO_PI;
    rjd.maxMotorTorque = 1000;
    rjd.enableMotor = false;

    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }

  void toggleMotor() {
    joint.enableMotor(!joint.isMotorEnabled());
  }

  void display() {
    p1.display();
    p2.display();

    Vec2 anchor = box2d.coordWorldToPixels(p1.body.getWorldCenter());

    stroke(0);
    ellipse(anchor.x, anchor.y, 5, 5);
  }
}
