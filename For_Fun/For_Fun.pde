//This is just a particle system.
ArrayList<ParticleSystem> mSystems;
PVector gravity;
void setup() {
  size(600, 400);
  mSystems = new ArrayList<ParticleSystem>();
  gravity = new PVector(0, 0.05);
}

void mouseClicked() {
  PVector emitter = new PVector(mouseX, mouseY);
  mSystems.add(new ParticleSystem(emitter));
}


void draw() {

  background(255);

  for (ParticleSystem ps : mSystems) {
    ps.applyForce(gravity);
    ps.run();
  }
}