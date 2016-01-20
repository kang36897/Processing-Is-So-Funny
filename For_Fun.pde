
Particle p;
PVector gravity;
void setup() {
  size(600, 400);
  p = new Particle(new PVector(width/2, height/2));
  gravity = new PVector(0, 0.05);
}


void draw() {

  background(255);
  p.display();

  p.applyForce(gravity);
  p.update();
}