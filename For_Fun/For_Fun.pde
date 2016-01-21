
ParticleSystem ps;
PVector gravity;
void setup() {
  size(600, 400);
  ps = new ParticleSystem(new PVector(width/2, 20));
  gravity = new PVector(0, 0.05);
}


void draw() {

  background(255);
  ps.addParticle();
  
  ps.applyForce(gravity);
  ps.run();
 
}