//This is just a particle system.
ParticleSystem ps;
Emitter m;
Attractor a;
float r;
PVector gravity;
void setup() {
  size(600, 400);
  r = 100;
  a = new Attractor( new PVector(width/2, height/2));
  m = new Emitter(new PVector(width/2 - r, height/2), new PVector(0, 0));
  ps = new ParticleSystem(m);
  gravity = new PVector(0, 0.05);
}


void draw() {
  background(255);

  PVector force = a.attract(m);
  m.applyForce(force);
  m.applyForce(gravity);
  m.update();

  stroke(0, 127);
  line(a.mLocation.x, a.mLocation.y, m.mLocation.x, m.mLocation.y);
  a.display();

  ps.applyForce(gravity);
  ps.run();
}