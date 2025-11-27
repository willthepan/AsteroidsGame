
Spaceship ship;
Star[] stars;
ArrayList<Asteroid> rocks;

void setup()
{
  size(800, 600);
  ship = new Spaceship();

  stars = new Star[75];
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }

  rocks = new ArrayList<Asteroid>();
  for (int i = 0; i < 5; i++)
  {
    rocks.add(new Asteroid());
  }
}

void draw()
{
  background(0);

  for (Star s : stars)
  {
    s.move();
    s.show();
  }

  ship.move();
  ship.show();

  for (int i = rocks.size() - 1; i >= 0; i--)
  {
    Asteroid r = rocks.get(i);
    r.move();
    r.show();

    float d = dist(
      (float)ship.getX(), (float)ship.getY(),
      (float)r.getX(), (float)r.getY()
    );

    if (d < 20)
    {
      rocks.remove(i);
    }
  }
}

void keyPressed()
{
  if (key == 'a' || key == 'A') ship.turn(-10);
  else if (key == 'd' || key == 'D') ship.turn(10);
  else if (key == 'w' || key == 'W') { ship.accelerate(0.2); ship.setThrusting(true); }
  else if (key == 'h' || key == 'H') ship.hyperspace();
}

void keyReleased()
{
  if (key == 'w' || key == 'W') ship.setThrusting(false);
}
class Asteroid extends Floater
{
  private double rotSpeed;

  public Asteroid()
  {
    corners = 6;
    xCorners = new int[]{-11, -11, -5, 6, 13, 7};
    yCorners = new int[]{-8, 8, 0, 10, 0, -8};

    myColor = color(200);

    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;

    myXspeed = (Math.random() * 2) - 1;
    myYspeed = (Math.random() * 2) - 1;

    myPointDirection = Math.random() * 360;

    rotSpeed = (Math.random() * 2) - 1; // -1 to 1 degrees per frame
  }

  public void move()
  {
    turn(rotSpeed);
    super.move();
  }

  public double getX() { return myCenterX; }
  public double getY() { return myCenterY; }
}
