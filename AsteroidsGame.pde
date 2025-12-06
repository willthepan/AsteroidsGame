Spaceship ship;
Star[] stars;
ArrayList<Asteroid> rocks;
ArrayList<Bullet> bullets;
int score;

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

  bullets = new ArrayList<Bullet>();
  score = 0;
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

  for (int i = bullets.size() - 1; i >= 0; i--)
  {
    Bullet b = bullets.get(i);
    b.move();

    if (b.getX() < 0 || b.getX() > width || b.getY() < 0 || b.getY() > height)
    {
      bullets.remove(i);
      continue;
    }

    b.show();
  }

  for (int i = rocks.size() - 1; i >= 0; i--)
  {
    Asteroid r = rocks.get(i);
    r.move();
    r.show();

    float dShip = dist(
      (float)ship.getX(), (float)ship.getY(),
      (float)r.getX(), (float)r.getY()
    );

    if (dShip < 20)
    {
      rocks.remove(i);
      continue;
    }

    for (int j = bullets.size() - 1; j >= 0; j--)
    {
      Bullet b = bullets.get(j);

      float d = dist(
        (float)b.getX(), (float)b.getY(),
        (float)r.getX(), (float)r.getY()
      );

      if (d < 20)
      {
        bullets.remove(j);
        rocks.remove(i);
        score += 10;
        break;
      }
    }
  }

  fill(255);
  textSize(20);
  text("Score: " + score, 10, 20);
}

void keyPressed()
{
  if (key == 'a' || key == 'A') ship.turn(-10);
  else if (key == 'd' || key == 'D') ship.turn(10);
  else if (key == 'w' || key == 'W') { ship.accelerate(0.2); ship.setThrusting(true); }
  else if (key == 'h' || key == 'H') ship.hyperspace();
  else if (key == ' ')
  {
    bullets.add(new Bullet(ship));
  }
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

    rotSpeed = (Math.random() * 2) - 1;
  }

  public void move()
  {
    turn(rotSpeed);
    super.move();
  }

  public double getX() { return myCenterX; }
  public double getY() { return myCenterY; }
}

class Bullet extends Floater
{
  public Bullet(Spaceship theShip)
  {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();

    myXspeed = theShip.getXSpeed();
    myYspeed = theShip.getYSpeed();

    myPointDirection = theShip.getPointDirection();

    myColor = color(255, 255, 0);

    accelerate(6.0);
  }

  public void move()
  {
    myCenterX += myXspeed;
    myCenterY += myYspeed;
  }

  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }

  public double getX() { return myCenterX; }
  public double getY() { return myCenterY; }
}
