class  Custom {
  Body body;
  float w;
  float h;
  float r;

  Custom(PVector l) {

    w = 10;
    h = 200;
    r = 7;

    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    Vec2 offset = new Vec2(0, -h/2);
    offset = box2d.vectorPixelsToWorld(offset);
    cs.m_p.set(offset.x, offset.y);
    
    CircleShape cs1 = new CircleShape();
    cs1.m_radius = box2d.scalarPixelsToWorld(r*10);
    Vec2 offset1 = new Vec2(0, 0);
    offset = box2d.vectorPixelsToWorld(offset);
    cs1.m_p.set(offset1.x, offset1.y);


    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(l.x, l.y));
    body = box2d.createBody(bd);

    body.createFixture(ps, 1);
    body.createFixture(cs, 1);
    body.createFixture(cs1, 0.5);

    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
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
    ellipse(0, -h/2, r*2, r*2);
    ellipse(0, 0, r*20, r*20);
    popMatrix();
  }
}
