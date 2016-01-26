class DotParticle extends Particle {

  public DotParticle() {
    super();
    mVelocity.mult(0);
  }

  public DotParticle(PVector l) {
    super(l);
    mVelocity.mult(0);
  }

  public void lifeElapse() {
    lifeSpan -= 0.7;
  }

  void display() {
    stroke(0, lifeSpan);
    fill(255, lifeSpan);
    strokeWeight(1);
    pushMatrix();
    translate(mLocation.x, mLocation.y);
    ellipse(0, 0, mass * 3, mass * 3);
    popMatrix();
  }
}