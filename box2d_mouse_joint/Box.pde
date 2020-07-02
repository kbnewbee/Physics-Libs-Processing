class  Box {
  Body body;
  float w;
  float h;

  Box(PVector l) {

    w = 60;
    h = 60;

    makeBody(l, w, h);
  }

  boolean contains(PVector l) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(l.x, l.y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }

  void makeBody(PVector l, float w_, float h_) {

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(l.x, l.y));

    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w_/2);
    float box2Dh = box2d.scalarPixelsToWorld(h_/2); 
    ps.setAsBox(box2Dw, box2Dh);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5; 

    body.createFixture(fd);
  }

  void display() {

    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    stroke(0);
    fill(127);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}
