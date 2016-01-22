public class Particle {
  Particle mNext;

  PVector mLocation;
  PVector mVelocity;
  PVector mAcceleration;
  float lifeSpan;
  float mass;

  public Particle() {
  }

  public Particle(PVector l) {
    mLocation = l.copy();
    mVelocity = PVector.random2D();
    mAcceleration = new PVector();
    lifeSpan = 255;
    mass = 1;
  }

  public void setLocation(PVector l) {
    mLocation = l.copy();
    mVelocity = PVector.random2D();
    mAcceleration.mult(0);
    lifeSpan = 255;
  }

  boolean isDead() {
    if (lifeSpan <= 0) {
      return true;
    } else {
      return false;
    }
  }

  void run(){
    update();
    display();
  }


  void update() {
    mLocation.add(mVelocity);
    mVelocity.add(mAcceleration);

    mAcceleration.mult(0);

    lifeSpan -= 2;
  }

  void applyForce(PVector force) {
    mAcceleration.add(force.div(mass));
  }

  void display() {
    stroke(0, lifeSpan);
    fill(127, lifeSpan);
    pushMatrix();
    translate(mLocation.x, mLocation.y);
    ellipse(0, 0, mass * 24, mass * 24);

    popMatrix();
  }
}