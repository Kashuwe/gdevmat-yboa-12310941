BlackHole bh;
Walker[] walkers;
int numWalkers = 100;
int resetInterval = 150;  

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  resetSimulation();  
}

void draw() 
{
  background(0);
  
  // Update and render each walker 
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i].update(bh);
    walkers[i].render();
  }
 
  bh.render();
  
  // Used modulo since the simulation is continuous; every 200 frames, a reset is triggered.
  if (frameCount % resetInterval == 0) 
  {
    resetSimulation();
  }
}

void resetSimulation()
{
  bh = new BlackHole();  
  
  // Initialize walkers 
  walkers = new Walker[numWalkers];
  for (int i = 0; i < numWalkers; i++) 
  {
    walkers[i] = new Walker();
  }
}
