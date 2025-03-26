void setup()
{
  size(1280, 720, P3D); // set windows size to 1280 x 720
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

Walker perlinWalker = new Walker();

float tR = 0, tG = 100, tB = 200;

void draw()
{
  float r = map(noise(tR), 0, 1, 0, 255);
  float g = map(noise(tG), 0, 1, 0, 255); 
  float b = map(noise(tB), 0, 1, 0, 255); 
    
  fill(r, g, b);
  noStroke();
  perlinWalker.render();
  perlinWalker.perlinWalk();
  
  tR += 0.02; 
  tG += 0.03;
  tG += 0.04;
}
