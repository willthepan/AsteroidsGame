class Star {
  private double x, y;
  private double xSpeed, ySpeed;
  private int size;
  private int brightness;

  public Star() {
    x = Math.random()*width;
    y = Math.random()*height;
    size = 2 + (int)(Math.random()*4);
    brightness = 155 + (int)(Math.random()*100);
    xSpeed = (Math.random()*0.6) - 0.3;
    ySpeed = (Math.random()*0.6) - 0.3;
  }

  public void move() {
    x += xSpeed;
    y += ySpeed;
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }

  public void show() {
    noStroke();
    fill(brightness);
    ellipse((float)x, (float)y, size, size);
  }
}
