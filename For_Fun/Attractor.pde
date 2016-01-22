class Attractor extends Mover {

  public Attractor(PVector l) {
    super(l);
    mass = 2;
  }

  public void display() {
    stroke(0);
    fill(255);
    pushMatrix();
    translate(mLocation.x, mLocation.y);
    ellipse(0, 0, mass * 24, mass * 24);
    popMatrix();
  }

  public PVector attract(Mover m) {
    PVector f = PVector.sub(mLocation, m.mLocation);
    float distance = constrain(f.mag(), 0.1, 3);
    f.normalize();
    f.mult(G * mass * m.mass / (distance * distance));
    return f;
  }
}