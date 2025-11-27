class Floater
{
  protected int corners;
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY;
  protected double myXspeed, myYspeed;
  protected double myPointDirection;

  public void accelerate(double dAmount)
  {
    double dRadians = myPointDirection * (Math.PI / 180);
    myXspeed += dAmount * Math.cos(dRadians);
    myYspeed += dAmount * Math.sin(dRadians);
  }

  public void turn(double degreesOfRotation)
  {
    myPointDirection += degreesOfRotation;
  }

  public void move()
  {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    if (myCenterX > width) myCenterX = 0;
    else if (myCenterX < 0) myCenterX = width;

    if (myCenterY > height) myCenterY = 0;
    else if (myCenterY < 0) myCenterY = height;
  }

  public void show()
  {
    float angle = (float)(myPointDirection * Math.PI / 180.0);
    float cosA = cos(angle);
    float sinA = sin(angle);

    fill(myColor);
    stroke(myColor);

    beginShape();
    for (int i = 0; i < corners; i++)
    {
      float x = xCorners[i];
      float y = yCorners[i];

      float rotatedX = x * cosA - y * sinA;
      float rotatedY = x * sinA + y * cosA;

      vertex((float)myCenterX + rotatedX,
             (float)myCenterY + rotatedY);
    }
    endShape(CLOSE);
  }
}
