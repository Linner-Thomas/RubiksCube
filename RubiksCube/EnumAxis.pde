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
}
