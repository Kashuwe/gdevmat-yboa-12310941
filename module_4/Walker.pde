public class Walker 
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 10;
  public float scale;
  
  public Walker()
  {
    // Set a random position for the walkers within screen bounds
    position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    scale = random(5, 20);
    acceleration = new PVector(-0.01, 0.1);
  }
  
  public void update() 
  {
     // Calculate the direction from this Walker to the mouse cursor
    PVector target = mousePos();
    PVector direction = PVector.sub(target, this.position);
    
    // normalize and scale the direction vector
    direction.normalize();
    direction.mult(0.2);
    
    // assign direction to the acceleration
    this.acceleration = direction;
  
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render() 
  {
    // Played a bit and added colors to the walkers
    noStroke();
    fill(180, 210, 230, 200);
    circle(position.x, position.y, scale);
  }
}
