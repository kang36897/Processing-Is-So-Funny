class Mover {
  public final static float G = 1;
  PVector mLocation;
  PVector mVelocity;
  PVector mAcceleration;
  float mass;

  boolean isRest = false;

  public Mover() {
  }

  public Mover(PVector l) {
    mLocation = l.copy();
    mVelocity = PVector.random2D();
    mAcceleration = new PVector();

    mass = 1;
  }

  public void rest(boolean peace) {
    if (peace) {
      isRest = true;
      mAcceleration.mult(0);
      mVelocity.mult(0);
      return;
    }


    isRest = false;
  }


  public void setLocation(PVector l) {
    mLocation = l.copy();
    mVelocity = PVector.random2D();
    mAcceleration.mult(0);
  }

  public void update() {
    if (isRest) {
      return;
    }

    mLocation.add(mVelocity);
    mVelocity.add(mAcceleration);

    mAcceleration.mult(0);
  }

  public void applyForce(PVector force) {
    PVector f = force.copy();
    mAcceleration.add(f.div(mass));
  }

  public void display() {
    stroke(0);
    fill(127);
    rectMode(CENTER);
    pushMatrix();
    translate(mLocation.x, mLocation.y);
    rect(0, 0, mass * 12, mass * 12);

    popMatrix();
  }
}