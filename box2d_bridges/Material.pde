class  Material {
  Body body;
  float r;

  Material(PVector l, boolean flag) {
    r = 10;
    makeBody(l, flag);
  }

  void makeBody(PVector l, boolean flag_) {

    BodyDef bd = new BodyDef();
    if (!flag_) bd.type = BodyType.DYNAMIC;
    else bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(l.x, l.y));
    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);    
    cs.m_p.set(0, 0);

    body.createFixture(cs, 1);
  }

  void display() {

    Vec2 pos = box2d.getBodyPixelCoord(body);

    pushMatrix();
    translate(pos.x, pos.y);
    stroke(127);
    fill(127, 64);
    ellipseMode(CENTER);
    ellipse(0, 0, r*2, r*2);
    popMatrix();
  }
}
