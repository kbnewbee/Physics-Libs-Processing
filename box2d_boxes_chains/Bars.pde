class Bars {
  Body body;

  float w, h;

  Bars(PVector l) {
    w = 150;
    h = 20;

    makeBody(l, w, h);
  }

  void makeBody(PVector l, float w_, float h_) {

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(l.x, l.y));
    bd.angle = PI/4;

    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w_/2);
    float box2Dh = box2d.scalarPixelsToWorld(h_/2); 
    ps.setAsBox(box2Dw, box2Dh);

    body.createFixture(ps, 1);

    //body.setLinearVelocity(new Vec2(5,0));
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    //println(body.getAngle());
    
    float a = PI/4;
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    stroke(0);
    fill(0);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}
