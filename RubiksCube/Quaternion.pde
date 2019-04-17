public class Quaternion 
{  
  // Attributes
  public float x, y, z, w;
  
 /**
   * Default - CONSTRUCTOR
   *
   * Initialize the Quaternion with default values
   */
  public Quaternion() 
  {
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.w = 1;
  }
  
  /**
   * CONSTRUCTOR
   *
   * Initialize the Quaternion using angle and axis
   *
   * @param angle The angle of the rotation
   * @param axis  The axis to rotate around
   */
  public Quaternion(float angle, EnumAxis axis) 
  {   
      float im = sin(angle / 2);
      float re = cos(angle / 2);
      
      x = im * axis.getX();
      y = im * axis.getY();
      z = im * axis.getZ();
      w = re;
  }
  
  /**
   * Quaternion multiplication
   *
   * @param other The Quaternion to multipy with
   *
   * @return Result of the multiplication (new rotation)
   */
  public Quaternion multiply(Quaternion other) 
  {
      Quaternion product = new Quaternion();
      
      product.x = other.w * x + other.x * w + other.y * z - other.z * y;
      product.y = other.w * y - other.x * z + other.y * w + other.z * x;
      product.z = other.w * z + other.x * y - other.y * x + other.z * w;
      product.w = other.w * w - other.x * x - other.y * y - other.z * z;
      
      return product;
  }
  
  /**
   * Convert the Quaternion into a rotation Matrix
   *
   * @return Rotation Matrix
   */
  public PMatrix3D getRotationMatrix()
  {
    return new PMatrix3D(1 - 2 * y * y - 2 * z * z, 2 * x * y - 2 * z * w,     2 * x * z + 2 * y * w,     0f,
                         2 * x * y + 2 * z * w,     1 - 2 * x * x - 2 * z * z, 2 * y * z - 2 * x * w,     0f,
                         2 * x * z - 2 * y * w,     2 * y * z + 2 * x * w,     1 - 2 * x * x - 2 * y * y, 0f,
                         0f,                        0f,                        0f,                        1f);
  }
}
