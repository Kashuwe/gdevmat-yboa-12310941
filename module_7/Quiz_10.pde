Walker[] walkers = new Walker[10]; // Array to hold the walkers
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  for (int i = 0; i < walkers.length; i++) 
  {
    float totalWidth = Window.right - Window.left; 
    float spacing = totalWidth / (walkers.length + 1); 
    float posX = Window.left + spacing * (i + 1); 

    walkers[i] = new Walker(); 
    walkers[i].position.set(posX, 300);

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
  ocean.render();
  
  for (int i = 0; i < walkers.length; i++) {
    
    walkers[i].render();
    walkers[i].update();
    
    PVector wind = new PVector(0.1, 0);
    walkers[i].applyForce(wind); // applying wind to the Walkers
    
    PVector gravity = new PVector(0, -0.15 * walkers[i].mass);
    walkers[i].applyForce(gravity); // applying gravity to the Walkers
    
    if (walkers[i].position.y <= Window.bottom)
    {
      walkers[i].position.y = Window.bottom;
      walkers[i].velocity.y *= -1;
      
      float c = 0.1f;
      float normal = 1;
      float frictionMagnitude = c * normal;
      PVector friction = walkers[i].velocity.copy();
      walkers[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // applying friction to the Walkers
    }
    
     if (ocean.isCollidingWith(walkers[i]))
    {
       PVector dragForce = ocean.calculateDragForce(walkers[i]);
       walkers[i].applyForce(dragForce);
    } 
  }
}
