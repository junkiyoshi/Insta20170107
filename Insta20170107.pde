import de.voidplus.leapmotion.*;

import java.util.*;
import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing box2d;
ArrayList<Particle> particles;
Box box;

float r, g, b;

void setup()
{
  size(1024, 1024);
  background(0);
  frameRate(30);
  colorMode(HSB);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  
  particles = new ArrayList<Particle>();
  box = new Box();
}

void draw()
{
  background(0);
  box2d.step();
  
  // box.display();
  
  if(frameCount % 10 == 0)
  {
    float cc = frameCount % 255;
    int span = 3;
    float cc_span = 255 / (360 / span);
    float adjust = frameCount % 3;
    for(int i = 0; i < 360; i += span)
    {
      float x = 30 * cos(radians(i + adjust));
      float y = 30 * sin(radians(i + adjust));
      color c = color(cc, 255, 255);
      cc = (cc + cc_span) % 255;
      
      Particle p = new Particle(width / 2 + x, height / 2 - y, span, c);
      p.body.setLinearVelocity(new Vec2(x, y));
      particles.add(p);
    }
    
    
  }
  
  Iterator<Particle> it = particles.iterator();
  while(it.hasNext())
  {
    Particle p = it.next();
    p.display();
    
    if(p.isDead())
    {
      it.remove();
    }
  }
  
  println(frameCount);
  /*
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}