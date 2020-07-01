class  Box {
  Body body;

  PVector loc;
  float w;
  float h;

  Box(PVector l) {
    loc = l.get();
    w = 10;
    h = 10;


    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(loc.x, loc.y));

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
    rect(0, 0, 10, 10);
    popMatrix();
  }
}
