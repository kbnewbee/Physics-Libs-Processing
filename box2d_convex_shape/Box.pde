class  Custom {
  Body body;

  Custom(PVector l) {

    Vec2[] ver = new Vec2[4];
    ver[0] = box2d.vectorPixelsToWorld(new Vec2(-15, 25));
    ver[1] = box2d.vectorPixelsToWorld(new Vec2(15, 0));
    ver[2] = box2d.vectorPixelsToWorld(new Vec2(20, -15));
    ver[3] = box2d.vectorPixelsToWorld(new Vec2(-10, -10));

    PolygonShape ps = new PolygonShape();
    ps.set(ver, ver.length);


    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(l.x, l.y));
    body = box2d.createBody(bd);

    body.createFixture(ps, 1);

    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }

  void display() {

    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    PolygonShape ps =(PolygonShape) f.getShape();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    stroke(0);
    fill(127);
    rectMode(CENTER);
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++ ) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }

    endShape(CLOSE);
    popMatrix();
  }
}
