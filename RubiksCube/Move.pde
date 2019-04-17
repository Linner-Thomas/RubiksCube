class Move
{
  // Variables for Move configuration
  private EnumAxis axis;
  private int layer;
  private int dir;
  
  // Variables for state
  float angle;
  boolean executing;
  
  /**
   * CONSTRUCTOR
   *
   * Initialize the Move
   *
   * @param axis  The axis to rotate around
   * @param layer The layer of the side
   * @param dir   The direction to rotate in
   */
  public Move(EnumAxis axis, int layer, int dir)
  {
    this.axis = axis;
    this.layer = layer;
    this.dir = layer * dir;
  }
  
  /**
   * GETTER : Executing
   *
   * @return True / False whether move is executing or not
   */
  public boolean isExecuting()
  {
    return this.executing;
  }
  
  /**
   * Start the Move
   */
  public void start()
  {
    executing = true;
  }
  
  /**
   * Update the move, get's called every frame
   */
  public void update()
  {
    if (executing)
    {
      if (abs(angle) <= HALF_PI)
      {
        angle += PI / 100 * dir;
      
        RubiksCube.cube.rotate(axis, layer, PI / 100 * dir, false);
      }
        
      else
        finish();
    }
  }
  
  /**
   * Finish the Move
   */
  public void finish()
  { 
    // Clean up
    RubiksCube.cube.rotate(axis, layer, 0, true); 
   
    // Reset state
    executing = false;
    angle = 0;
  }
}
