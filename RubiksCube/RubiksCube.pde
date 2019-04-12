import peasy.*;

// Create instance of Camera
PeasyCam cam;

// Create instance of Cube
Cube cube;

/**
 * Call on startup to configure Screen, Camera and Cube
 */
void setup()
{
  // Setup Screen
  size(800, 800, P3D);
  
  // Setup Camera
  cam = new PeasyCam(this, 0, 0, 0, 500);
  
  // Setup Cube
  cube = new Cube();
}

/**
 * Call every Frame to render Cube and Axis
 */
void draw()
{
  // Render background
  background(0);
  
  // Render Axis
  renderAxis();
  
  // Render Cube
  cube.render();
}

/**
 * Render the x, y and z Axis
 */
void renderAxis()
{
  strokeWeight(4);
  
  for (EnumAxis axis : EnumAxis.values())
  {
    stroke(axis.getColor());
    
    line(0, 0, 0, axis.getX() * 500, axis.getY() * 500, axis.getZ() * 500);
  }
}
