class Cubie
{
  // Define constant for SIZE of Cubie
  public static final int SIZE = 30;
  
  // Vector holding the position
  private PVector position;
  
  // Array holding all the Faces
  private Face[] faces = new Face[6];
  
  // Array holding all the colors
  private EnumColor[] colors = new EnumColor[6];
  
  /**
   * CONSTRUCTOR
   *
   * Initialize the Cubie by setting its transformation and creating its Faces
   *
   * @param x The x-Position of the Cubie
   * @param y The y-Position of the Cubie
   * @param z The z-Position of the Cubie
   */
  public Cubie(int x, int y, int z)
  {
    // Create starting position
    position = new PVector(x, y, z);
    
    // Initialize Colors for Faces
    initColors(x, y, z);
    
    // Initialize Faces
    initFaces();
  }
  
  /**
   * Initialize the Colors based on the position in the Cube
   *
   * @param x The x-Position of the Cubie
   * @param y The y-Position of the Cubie
   * @param z The z-Position of the Cubie 
   */
  private void initColors(int x, int y, int z)
  {
    // LEFT and RIGHT
    if (x == -1)     colors[0] = EnumColor.ColorGreen;
    else if (x == 1) colors[3] = EnumColor.ColorBlue;
    
    // UP and DOWN
    if (y == -1)     colors[1] = EnumColor.ColorWhite;
    else if (y == 1) colors[4] = EnumColor.ColorYellow;
    
    // BACK and FRONT
    if (z == -1)     colors[2] = EnumColor.ColorOrange;
    else if (z == 1) colors[5] = EnumColor.ColorRed;
    
    // Inner Faces
    for (int index = 0; index < colors.length; index ++)
      if (colors[index] == null)
        colors[index] = EnumColor.ColorBlack;
  }
  
  /**
   * Initialize Faces
   */
  private void initFaces()
  {
    faces[0] = new Face(EnumAxis.AxisX, -1, colors[0]);
    faces[1] = new Face(EnumAxis.AxisY, -1, colors[1]);
    faces[2] = new Face(EnumAxis.AxisZ, -1, colors[2]);
    
    faces[3] = new Face(EnumAxis.AxisX, 1, colors[3]);
    faces[4] = new Face(EnumAxis.AxisY, 1, colors[4]);
    faces[5] = new Face(EnumAxis.AxisZ, 1, colors[5]);
  }
  
  /**
   * Render the Cubie by rendering all its Faces
   */
  public void render()
  {
    pushMatrix();
    {
      // Translate into center of Cubie
      translate(SIZE * (position.x + 0.5), SIZE * (position.y + 0.5), SIZE * (position.z + 0.5));
      
      // Loop through Faces and render them
      for (Face face : faces)
          face.render();
    }
    popMatrix();
  }
}
