class Bridge {
  ArrayList<Material> mats;
  float leng = 20;

  Bridge(int len) {
    mats = new ArrayList<Material>();

    for (int i=0; i <= len; i++) {
      Material m = null;

      if (i == 0 || i == len) m = new Material(new PVector(i*20, height/2), true);
      else m = new Material(new PVector(i*20, height/2), false);

      mats.add(m);
      if (i>0) {
        DistanceJointDef djd = new DistanceJointDef();
        Material prev = mats.get(i-1); 
        djd.bodyA = prev.body;
        djd.bodyB = m.body;

        djd.length = box2d.scalarPixelsToWorld(leng);

        djd.frequencyHz = 10;
        djd.dampingRatio = 0;

        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }

  void display() {
    for (Material m : mats) {
      m.display();
    }
  }
}
