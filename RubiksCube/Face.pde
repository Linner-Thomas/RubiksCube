class Face
{ 
  // Axis in which the Face is sitting
  private EnumAxis axis;  
  
  // Level of the Face (-1 / 1)
  private int level;
  
  // Color of the Face
  private EnumColor ecolor;
  
  /**
   * CONSTRUCTOR
   *
   * Initialize the Face by setting its axis and level
   *
   * @param axis   The Axis in which the Face is sitting
   * @param level  The level of the Face (-1 / 1)
   * @param ecolor The Color of the Face
   */
  public Face(EnumAxis axis, int level, EnumColor ecolor)
  {
    this.axis = axis;
    this.level = level;
    this.ecolor = ecolor;
  }
  
  /**
   * Render the Face with correct translation, rotation and color
   */
  public void render()
  {
    pushMatrix();
    {
      rectMode(CENTER);
      
      stroke(#000000);
      strokeWeight(1);
      
      // Get Color for Face
      fill(ecolor.getRGB());
      
      // Translate Face into correct position
      translate(Cubie.SIZE / 2 * (axis.getX() * level - 1), Cubie.SIZE / 2 * (axis.getY() * level - 1), Cubie.SIZE / 2 * (axis.getZ() * level - 1));
      
      // Rotate Face according to its Axis
      rotate(HALF_PI, axis.getY(), axis.getX(), axis.getZ());
      
      // Render Face
      rect(0, 0, Cubie.SIZE, Cubie.SIZE);
      
    }
    popMatrix();
  }
}
