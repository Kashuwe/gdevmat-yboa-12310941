class Walker
{
  float x;
  float y;
  
  void render()
  {
    float r = random(0, 255);  
    float g = random(0, 255);  
    float b = random(0, 255);   
    float a = random(50, 100);  // Random alpha between 50 and 100
    
    //println("r RNG: " + r);
    //println("g RNG: " + g);
    //println("b RNG: " + b);
    //println("a RNG: " + a);
     
    fill(r, g, b, a);  
    noStroke();
    circle(x, y, 30); 
  }

  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      y+=10;
    }
    else if (rng == 1)
    {
      y-=10;
    }
    else if (rng == 2)
    {
      x+=10;
    }
    else if (rng == 3)
    {
      x-=10;
    }
    else if (rng == 4)
    {
      y+=10;
      x+=10;
    }
    else if (rng == 5)
    {
      y-=10;
      x-=10;
    }
    else if (rng == 6)
    {
      y+=10;
      x-=10;
    }
    else if (rng == 7)
    {
      y-=10;
      x+=10;
    }
     //println("Walk RNG: " + rng);
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(100)); 
     
    if (rng < 40) // 40% chance of moving right
    {
      x += 10;
    }
    else if (rng < 60) // 20% chance of moving left
    {
      x -= 10;
    }
    else if (rng < 80) // 20% chance moving up
    {
      y -= 10;
    }
    else // 20% chance moving down
    {
      y += 10;
    }
    //println("WalkBiased RNG: " + rng);
  }
}
