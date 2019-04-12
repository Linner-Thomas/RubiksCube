enum EnumAxis
{
  AxisX, AxisY, AxisZ;
  
  /**
   * Check if given Axis is x-Axis
   * Used for translation and rotation
   *
   * @return 1 / 0 whether Axis is x-Axis
   */
  public int getX()
  {
    return this == AxisX ? 1 : 0;
  }
  
  /**
   * Check if given Axis is y-Axis
   * Used for translation and rotation
   *
   * @return 1 / 0 whether Axis is y-Axis
   */
  public int getY()
  {
    return this == AxisY ? 1 : 0;
  }
  
 /**
   * Check if given Axis is z-Axis
   * Used for translation and rotation
   *
   * @return 1 / 0 whether Axis is z-Axis
   */
  public int getZ()
  {
    return this == AxisZ ? 1 : 0;
  }
  
  /**
   * Get Axis color for rendering
   *
   * @return color in HexString
   */
  public int getColor()
  {
    switch(this)
    {
      case AxisX: return #FF0000;
      case AxisY: return #00FF00;
      case AxisZ: return #0000FF;
      
      default: return #000000;
    }
  }
}
