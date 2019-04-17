class Cubie
{
  // Define constant for SIZE of Cubie
  public static final int SIZE = 30;
  
  // Vector holding the position
  private PVector position;
  
  // Quaternion holding the rotation
  private Quaternion rotation;
  
  // Array holding all the Faces
  private Face[] faces = new Face[6];
  
  // Array holding all the colors
  private EnumColor[] colors = new EnumColor[6];
  
  /**
   * CONSTRUCTOR
   *
   * Initialize the Cubie by setting its position and creating its Faces
   *
   * @param x The x-Position of the Cubie
   * @param y The y-Position of the Cubie
   * @param z The z-Position of the Cubie
   */
  public Cubie(int x, int y, int z)
  {
    // Create starting position
    position = new PVector(x, y, z);
    
    // Create starting rotation
    rotation = new Quaternion();
    
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
    if (x == -floor(Cube.SIZE / 2))     colors[0] = EnumColor.ColorGreen;
    else if (x == floor(Cube.SIZE / 2)) colors[3] = EnumColor.ColorBlue;
    
    // UP and DOWN
    if (y == -floor(Cube.SIZE / 2))     colors[1] = EnumColor.ColorWhite;
    else if (y == floor(Cube.SIZE / 2)) colors[4] = EnumColor.ColorYellow;
    
    // BACK and FRONT
    if (z == -floor(Cube.SIZE / 2))     colors[2] = EnumColor.ColorOrange;
    else if (z == floor(Cube.SIZE / 2)) colors[5] = EnumColor.ColorRed;
    
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
   * GETTER : position
   *
   * @return The position of the Cubie
   */
  public PVector getPosition()
  {
    return this.position;
  }
  
  /**
   * Render the Cubie by rendering all its Faces
   */
  public void render()
  {
    pushMatrix();
    {
      // Translate into center of Cubie
      translate(SIZE * position.x, SIZE * position.y, SIZE * position.z);

      // Rotate Cubie
      applyMatrix(rotation.getRotationMatrix());
      
      // Loop through Faces and render them
      for (Face face : faces)
          face.render();
    }
    popMatrix();
  }
  
  /**
   * Rotate a Cubie
   *
   * @param axis     The Axis to rotate the Cubie around
   * @param angle    The angle to rotate the Cubie
   * @param finished Signaled when rotation is finished
   */
  public void rotate(EnumAxis axis, float angle, boolean finished)
  { 
    // Calculate x-Position
    position.x = position.z * sin(angle * axis.getY()) + position.x * cos(angle * axis.getY());
    position.x = position.x * cos(angle * axis.getZ()) - position.y * sin(angle * axis.getZ());
    
    // Calculate y-Position
    position.y = position.x * sin(angle * axis.getZ()) + position.y * cos(angle * axis.getZ());
    position.y = position.y * cos(angle * axis.getX()) - position.z * sin(angle * axis.getX());
    
    // Calculate z-Position
    position.z = position.y * sin(angle * axis.getX()) + position.z * cos(angle * axis.getX());
    position.z = position.z * cos(angle * axis.getY()) - position.x * sin(angle * axis.getY());
    
    // Calculate rotation
    rotation = rotation.multiply(new Quaternion(angle, axis));
    
    // When the rotation is finished, whe have to clean up the position
    if (finished)
    {
      position.x = round(position.x);
      position.y = round(position.y);
      position.z = round(position.z);
    }
  }
}
