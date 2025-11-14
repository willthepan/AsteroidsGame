class Spaceship extends Floater  
{   
  private boolean thrusting;

  public Spaceship() {
    corners = 4;
    xCorners = new int[]{16, -8, -2, -8};
    yCorners = new int[]{0, -8, 0, 8};
    myColor = color(255);
    myCenterX = width/2.0;
    myCenterY = height/2.0;
    myXspeed = 0.0;
    myYspeed = 0.0;
    myPointDirection = 0.0;
    thrusting = false;
  }

  public void setThrusting(boolean t) {
    thrusting = t;
  }

  public void hyperspace() {
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random()*360;
  }

  public void show() {
    pushMatrix();
    translate((float)myCenterX, (float)myCenterY);
    rotate((float)(myPointDirection * Math.PI/180));
    fill(myColor);
    stroke(myColor);
    beginShape();
    for (int i = 0; i < corners; i++) vertex(xCorners[i], yCorners[i]);
    endShape(CLOSE);

    if (thrusting) {
      fill(255, 150, 0);
      stroke(255, 150, 0);
      beginShape();
      vertex(-8, -5);
      vertex(-22, 0);
      vertex(-8, 5);
      endShape(CLOSE);
    }
    popMatrix();
  }
}
