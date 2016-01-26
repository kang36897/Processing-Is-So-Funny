//This is just a particle system. //<>// //<>// //<>//
float distance = 150;
Star big;
PVector tempVelocity;
PVector tempLocation = new PVector();
void setup() {
  size(600, 600);
  smooth();

  big = new Star(new PVector(width / 2, height / 2), 0, 0, 0, 32);

  float angle = 0;

  for ( int i = 0; i < 3; i ++) {
    Star s = new Star(new PVector(0, 0), distance, angle, -TWO_PI / 1200, 16);
    s.orbit(big);
    s.showSatelliteOrbit(true);
    s.attached(new DotParticleSystem(s));

    Star child = new SpecialStar(new PVector(0, 0), distance / 2, angle + PI, -TWO_PI / 200, 8);
    child.orbit(s);
    child.attached(new LineParticleSystem(child));

    angle += HALF_PI * 4 / 3;
  }
}


void draw() {
  background(0);

  big.run();
}