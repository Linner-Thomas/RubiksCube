enum EnumColor
{
  ColorBlack,
  ColorWhite, ColorYellow, ColorRed, ColorOrange, ColorGreen, ColorBlue;
  
  /**
   * Get the RGB Value for an given EnumlColor in HexString
   *
   * @return RGB Value for Color
   */
  public int getRGB()
  {
    switch(this)
    {
      case ColorBlack:  return #000000;
      case ColorWhite:  return #FFFFFF;
      case ColorYellow: return #FFFF32;
      case ColorRed:    return #FF0000;
      case ColorOrange: return #FF9600;
      case ColorGreen:  return #146414;
      case ColorBlue:   return #0000FF;
      
      default: return #000000;
    }
  }
}
