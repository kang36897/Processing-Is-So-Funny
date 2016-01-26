class DotParticle extends Particle {

  public DotParticle() {
    super();
    mVelocity.mult(0);
  }

  public DotParticle(PVector l) {
    super(l);
    mVelocity.mult(0);
  }

  void display() {
    stroke(0, lifeSpan);
    fill(255, lifeSpan);
    pushMatrix();
    translate(mLocation.x, mLocation.y);
    ellipse(0, 0, mass * 4, mass * 4);

    popMatrix();
  }
}