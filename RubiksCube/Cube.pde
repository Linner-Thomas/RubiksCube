class Cube
{
  // Size of cube n * n * n
  public static final int SIZE = 3;
  
  // Array holding all the cubies
  private Cubie[] cubies;
  
  /**
   * CONSTRUCTOR
   *
   * Initialize the RubiksCube by creating its cubies
   */
  public Cube()
  {
    // Initialize arraysize
    this.cubies = new Cubie[SIZE * SIZE * SIZE];
    
    int index = 0;
    
    // Create Cubies
    for (int x = -floor(SIZE / 2); x <= floor(SIZE / 2); x ++)
      for (int y = -floor(SIZE / 2); y <= floor(SIZE / 2); y ++)
        for (int z = -floor(SIZE / 2); z <= floor(SIZE / 2); z ++, index ++)
          cubies[index] = new Cubie(x, y, z);
  }
  
  /**
   * Render the RubiksCube by rendering all its Cubies
   */
  void render()
  {
    // Loop through Cubies and render them
    for (Cubie cubie : cubies)
      cubie.render();
  }
  
  /**
   * Rotate an side of the Cube
   *
   * @param axis     The Axis the side is on
   * @param layer    The layer of the side
   * @param angle    The angle to rotate
   * @param finished Signaled when rotation is finished
   */
  public void rotate(EnumAxis axis, int layer, float angle, boolean finished)
  {
    switch (axis)
    {
      // x-Axis rotation
      case AxisX:
        for (Cubie cubie : cubies)
          if (round(cubie.getPosition().x) == layer)
            cubie.rotate(axis, angle, finished);
        
        break;
        
      // y-Axis rotation
      case AxisY:
        for (Cubie cubie : cubies)
          if (round(cubie.getPosition().y) == layer)
            cubie.rotate(axis, angle, finished);
        
        break;
        
      // z-Axis rotation
      case AxisZ:
        for (Cubie cubie : cubies)
          if (round(cubie.getPosition().z) == layer)
            cubie.rotate(axis, angle, finished);
        
        break;
    }
  }
}
