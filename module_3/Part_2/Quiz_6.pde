void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  PVector mouse = mousePos();
  // fix the length of the saber
  mouse.normalize().mult(350);
  
  // Print the magnitude of one side of the lightsaber
  println(mouse.mag());
  
  // Outer glow (Red)
  strokeWeight(13);
  stroke(255, 0, 0, 150);
  line(-mouse.x , -mouse.y, mouse.x, mouse.y);
  
  // Inner glow (White)
  strokeWeight(4);
  stroke(255);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
  // To overlap the outer glow around the handle
  strokeWeight(15); 
  stroke(130);
  mouse.normalize().mult(50); 
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
  // 3. Handle (Black)
  strokeWeight(8); 
  stroke(0);
  mouse.normalize().mult(50); 
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
}
