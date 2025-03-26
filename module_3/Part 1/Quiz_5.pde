void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker vectorWalker = new Walker();

void draw()
{
  // flush the screen with white bg every frame
  background(255);
  
  vectorWalker.render();
  vectorWalker.moveAndBounce();
}
