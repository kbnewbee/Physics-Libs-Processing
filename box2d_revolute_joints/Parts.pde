class Parts {
  Body body;

  float w, h;

  Parts(PVector l, float w, float h, boolean flag_) {
    this.w = w;
    this.h = h;

    BodyDef bd = new BodyDef();
    if (!flag_) bd.type = BodyType.DYNAMIC;
    else bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(l.x, l.y));
    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2); 
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
