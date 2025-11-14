Spaceship ship;
Star[] stars;

void setup() {
  size(600, 600);
  ship = new Spaceship();
  stars = new Star[200];
  for (int i = 0; i < stars.length; i++) stars[i] = new Star();
}

void draw() {
  background(0);

  for (int i = 0; i < stars.length; i++) {
    stars[i].move();
    stars[i].show();
  }

  ship.move();
  ship.show();
}

void keyPressed() {
  if (keyCode == LEFT) ship.turn(-10);
  else if (keyCode == RIGHT) ship.turn(10);
  else if (keyCode == UP) {
    ship.accelerate(0.3);
    ship.setThrusting(true);
  } 
  else if (key == 'h' || key == 'H') ship.hyperspace();
}

void keyReleased() {
  if (keyCode == UP) ship.setThrusting(false);
}
