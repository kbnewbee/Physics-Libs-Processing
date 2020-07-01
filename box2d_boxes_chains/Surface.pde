class Surface {
  ArrayList<Vec2> surface;

  Surface() {
    surface = new ArrayList<Vec2>();

    float ang =0; 
    for (float x = width+10; x>-10; x -=5) {
      float y = map(noise(ang), 0, 1, 150, 350);
      ang += 0.3;
      surface.add(new Vec2(x, y));
    }

    //surface.add(new Vec2(0, 300));
    //surface.add(new Vec2(width/3, 250));
    //surface.add(new Vec2(2*width/3, 300));
    //surface.add(new Vec2(width, 250));

    ChainShape chain = new ChainShape();
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i=0; i<vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    chain.createChain(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }

  void display() {
    //fill(0);
    noFill();
    beginShape();
    for (Vec2 v : surface) {
      vertex(v.x, v.y);
    }
    //vertex(width, height);
    //vertex(0, height);
    endShape();
  }
}
