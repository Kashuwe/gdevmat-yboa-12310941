public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  public float tScale = 0;
 
  
  void render()
  {
    float perlinScale = noise(tScale);
    float walkerScale = map(perlinScale, 0, 1, 5, 150);
    
    circle(x, y, walkerScale);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
    tScale += 0.01f;
  }
  
}
