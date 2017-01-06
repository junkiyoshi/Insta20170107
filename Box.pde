class Box {
  ArrayList<Vec2> surface;

  Box() {
    surface = new ArrayList<Vec2>();

    for(float i = 0; i <= 360; i += 0.5)
    {
      float x = 480 * cos(radians(i)) + width / 2;
      float y = 480 * sin(radians(i)) + height / 2;
      surface.add(new Vec2(x, y));
    }
    ChainShape chain = new ChainShape();

    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }

    chain.createChain(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }

  void display() {
    strokeWeight(1);
    stroke(128);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}