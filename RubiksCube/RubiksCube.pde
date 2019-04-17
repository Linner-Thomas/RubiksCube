import peasy.*;

// Create instance of Camera
private static PeasyCam cam;

// Create instance of Cube
public static Cube cube;

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

// List of available moves
Move moveU = new Move(EnumAxis.AxisY, -1, 1);
Move moveD = new Move(EnumAxis.AxisY,  1, 1);
Move moveR = new Move(EnumAxis.AxisX,  1, 1);
Move moveL = new Move(EnumAxis.AxisX, -1, 1);
Move moveF = new Move(EnumAxis.AxisZ,  1, 1);
Move moveB = new Move(EnumAxis.AxisZ, -1, 1);

Move currentMove = moveU;

/**
 * Check for pressed keys and start moves
 */
void keyPressed()
{
  if (!currentMove.isExecuting())
  {
    if      (key == 'u') currentMove = moveU; 
    else if (key == 'd') currentMove = moveD;
    else if (key == 'r') currentMove = moveR;
    else if (key == 'l') currentMove = moveL;
    else if (key == 'f') currentMove = moveF;
    else if (key == 'b') currentMove = moveB;
    
    currentMove.start();
  }
}

/**
 * Call every Frame to render Cube and Axis
 */
void draw()
{
  // Render background
  background(#555555);
  
  // Render Axis
  renderAxis();
  
  currentMove.update();
  
  // Render Cube
  cube.render();
}

/**
 * Render the x, y and z Axis
 */
void renderAxis()
{
  pushMatrix();
  strokeWeight(4);
  
  for (EnumAxis axis : EnumAxis.values())
  {
    stroke(axis.getColor());
    
    line(0, 0, 0, axis.getX() * 500, axis.getY() * 500, axis.getZ() * 500);
  }
  popMatrix();
}
