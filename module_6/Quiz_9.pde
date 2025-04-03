Walker[] walkers = new Walker[8]; // Array to hold the walkers

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  int posY = 0;
  for (int i = 0; i < walkers.length; i++) {
    posY = 2 * (Window.windowHeight / 8) * (i - (8 / 2));
    walkers[i] = new Walker(); 
    walkers[i].position.set(-500, posY);

    walkers[i].mass = int(random(1, 11));
    walkers[i].scale = walkers[i].mass * 15;
    
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
    walkers[i].a = random(150, 255);
  }
}

void draw()
{
  background(255);
  
  // can't figure out why it's not layering on top of the walkers
  stroke(0); 
  strokeWeight(2); 
  line(0, 360, 0, -360); 

  for (int i = 0; i < walkers.length; i++) {
    float mew = (walkers[i].position.x > 0) ? 0.4f : 0.01f; 
    //println("Walker " + i + " PosX: " + walkers[i].position.x + " | mu: " + mew); // debugging
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = walkers[i].velocity.copy(); // copy copies the current velocity of our walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    walkers[i].applyForce(friction);
    
    PVector acceleration = new PVector(0.2, 0); // for constant acceleration
    walkers[i].applyForce(acceleration);
    
    walkers[i].render();
    walkers[i].update();
    
    /*
    if (walkers[i].position.x >= Window.right)
    {
      walkers[i].position.x = Window.right;
      walkers[i].velocity.x *= -1;
    }
    
    if (walkers[i].position.y <= Window.bottom)
    {
      walkers[i].position.y = Window.bottom;
      walkers[i].velocity.y *= -1;
    }
    */
  }
}
