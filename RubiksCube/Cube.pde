class Cube
{
  // Size of cube n * n * n
  private int size = 3;
  
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
    this.cubies = new Cubie[size * size * size];
    
    int index = 0;
    
    // Create Cubies
    for (int x = -floor(size / 2); x <= floor(size / 2); x ++)
      for (int y = -floor(size / 2); y <= floor(size / 2); y ++)
        for (int z = -floor(size / 2); z <= floor(size / 2); z ++, index ++)
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
}
