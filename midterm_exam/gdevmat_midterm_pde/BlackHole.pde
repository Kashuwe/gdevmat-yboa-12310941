public class BlackHole 
{
  PVector position; 
  
  public BlackHole() 
  {
    // Random position spawning of the blackholes within screen bounds
    float x = random(Window.left, Window.right);
    float y = random(Window.bottom, Window.top);
    position = new PVector(x, y);
  }
  
  public void render() 
  {
    noStroke();
    fill(255);  
    circle(position.x, position.y, 50);
  }
}
