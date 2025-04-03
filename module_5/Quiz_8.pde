Walker[] walkers = new Walker[10]; // Declare an array to hold the walkers

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  // Initialize the walkers
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker(); 

    walkers[i].mass = int(random(1, 11));
    walkers[i].scale = walkers[i].mass * 15;
    
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
    
    walkers[i].position.set(-500, 200);
  }
}

void draw()
{
  background(80);
  
  // Update and render each walker
  for (int i = 0; i < walkers.length; i++) {
    walkers[i].render();
    walkers[i].update();
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
    
    // Boundary checks for each walker
    if (walkers[i].position.x <= Window.left)
    {
      walkers[i].velocity.x *= -1; // Newton's 3rd law of motion
    }
    
    if (walkers[i].position.x >= Window.right)
    {
      walkers[i].velocity.x *= -1; // Newton's 3rd law of motion
    }
    
    if (walkers[i].position.y <= Window.top)
    {
      walkers[i].velocity.y *= -1; // Newton's 3rd law of motion
    }
    
    if (walkers[i].position.y >= Window.bottom)
    {
      walkers[i].velocity.y *= -1; // Newton's 3rd law of motion
    }
  }
}
