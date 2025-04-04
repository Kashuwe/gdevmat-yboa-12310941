Walker[] walkers = new Walker[10];

//Walker bigMatter = new Walker();
//Walker smallMatter = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i] = new Walker(); 
    walkers[i].position.set(random(-640, 640), random(-360, 360));

    walkers[i].mass = int(random(1, 11));
    walkers[i].scale = walkers[i].mass * 15;
    
    // added color scheme hehe
    walkers[i].r = random(150, 200);   
    walkers[i].g = random(180, 230);   
    walkers[i].b = random(220, 255);   
    walkers[i].a = random(80, 160); 
  }
  
  /*
  bigMatter.position = new PVector();
  bigMatter.mass = 20;
  bigMatter.scale = bigMatter.mass * 10;
  
  smallMatter.position = new PVector(150, 150);
  smallMatter.mass = 10;
  smallMatter.scale = smallMatter.mass * 10;
  */
}

void draw()
{
  background(0);
  
  // two nested for loops to compute for each walker's attraction to every other walker 
  for (int i = 0; i < walkers.length; i++) {
    for (int j = 0; j < walkers.length; j++) {
      if (i != j) {
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(force);
      }
    }
  }
  
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i].render();
    walkers[i].update(); 
  }
  
  /*
  bigMatter.update();
  bigMatter.render();
  
  smallMatter.update();
  smallMatter.render();
  
  smallMatter.applyForce(bigMatter.calculateAttraction(smallMatter));
  bigMatter.applyForce(smallMatter.calculateAttraction(bigMatter));
  */
  
}
