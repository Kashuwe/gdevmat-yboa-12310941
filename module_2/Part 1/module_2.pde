void setup()
{
  size(1280, 720, P3D); // set windows size to 1280 x 720
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker(); // creates an instance of our walker class here in sketch
Walker biasedWalker = new Walker(); // another instance of the walker class that utilizes the randomWalkBiased function

void draw()
{
  myWalker.randomWalk();
  myWalker.render();
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
}
