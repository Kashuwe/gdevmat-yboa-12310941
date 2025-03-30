Walker[] walkers;
int numWalkers = 100;

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  walkers = new Walker[numWalkers];
  for (int i = 0; i < numWalkers; i++) 
  {
    walkers[i] = new Walker();
  }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw()
{
  background(230, 240, 250);
  
  for (int i = 0; i < numWalkers; i++) 
  {
    walkers[i].update();
    walkers[i].render();
  }
}
