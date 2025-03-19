// global variables
float amplitude = 30;
float frequency = 0.1;
float phase = 0;

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D); // set windows size to 1280 x 720
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

// the function that gets called every frame
// for 60fps, gets called 60x per second
// acts as the void main
void draw()
{
  background(0);
   
  drawCartesianPlane();
  drawLinearFunction(); 
  drawQuadracticFunction();
  drawSinWave();
  
  phase += 0.15;
}

void drawCartesianPlane()
{
  strokeWeight(1.5); // changes the thickness of the line below it
  color white = color(255, 255, 255); // declare a color var
  fill(white); // fills it with the color selected
  stroke(white); // all the strokes will be the color selected
  line(-300, 0, 300, 0); // draws a line x1, y1, x2, y2
  line(0, -300, 0, 300); // draws a line x1, y1, x2, y2
  
  for (int i = -300; i < 300; i+=10)
  {
    line (i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{  
  // f(x) = -5x + 30 (purple)  
  
  color purple = color(157 , 0, 255 );
  fill(purple);
  noStroke();
  
  for (float x = -50; x <= 50; x += 0.1f)
  {
    circle(x, x * -5 + 30, 5);
  } 
}

void drawQuadracticFunction()
{
  // f(x) = x^2 - 15x - 3 (yellow)
  
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x+= 0.1f)
  {
    circle(x * 10, ((float)Math.pow(x, 2) - (x * 15) - 3), 3);
  }
}

void drawSinWave()
{
  color blue = color(200, 98, 98);
  fill(blue);
  stroke(blue);
  
  for (float x = -200; x <= 200; x += 0.1f)  
  {
    float y = amplitude * (float)Math.sin(x * frequency + phase); 
    circle(x, y, 3);  
  }
}

void keyPressed() 
{
  // amplitude
  if (key == 'w' || key == 'W') {
    amplitude += 5;
  }
  if (key == 's' || key == 'S') {
    amplitude -= 5;
  }
  
  // frequency
  if (key == 'd' || key == 'D') {
    frequency += 0.01;
  }
  if (key == 'a' || key == 'A') {
    frequency -= 0.01;
  } 
}
