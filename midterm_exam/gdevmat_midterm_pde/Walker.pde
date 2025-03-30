public class Walker 
{
  PVector position;
  float size;
  color col;
  
  public Walker() 
  {
    // create position using a Gaussian distribution centered at 0.
    float x = (float)(randomGaussian() * (Window.widthPx / 3.0));
    float y = (float)(randomGaussian() * (Window.heightPx / 3.0));
    x = constrain(x, Window.left, Window.right);
    y = constrain(y, Window.bottom, Window.top);
    position = new PVector(x, y);
    
    // random size for the matters
    size = random(10, 35);
    
    // Random color for each matter
    col = color(random(255), random(255), random(255));
  }
  
  public void update(BlackHole bh) 
  {
    PVector direction = PVector.sub(bh.position, position);
    
    // Adding a slight variation using Perlin noise to add organic motion to the matter's movement
    float noiseVal = noise(position.x * 0.01, position.y * 0.01, frameCount * 0.01);
    float angleOffset = map(noiseVal, 0, 1, -PI/8, PI/8);
    direction.rotate(angleOffset);
    
    // Normalize the direction 
    direction.normalize();
    float speed = 8;
    direction.mult(speed);
    
    // Update position to move the walker towards the black hole
    position.add(direction);
  }
  
  public void render() 
  {
    noStroke();
    fill(col);
    circle(position.x, position.y, size);
  }
}
