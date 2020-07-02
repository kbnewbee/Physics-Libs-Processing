class Boundary {
  Body body;
  float w, h;
  boolean flag;

  Boundary(PVector l, boolean flag) {
    w = width;
    h = 20;
    this.flag = flag;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(l.x, l.y));
    if (flag == true) bd.setAngle(PI/2);
    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2); 
    ps.setAsBox(box2Dw, box2Dh);

    body.createFixture(ps, 1);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = PI/2;
    pushMatrix();
    translate(pos.x, pos.y);
    if(flag) rotate(a);
    println(pos.x);
    stroke(0);
    fill(0);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}
