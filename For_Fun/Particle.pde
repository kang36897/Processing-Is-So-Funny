public class Particle extends Mover {
  Particle mNext;

  float lifeSpan; 

  public Particle() {
    super();
  }

  public Particle(PVector l) {
    super(l);
    lifeSpan = 255;
  }

  public void setLocation(PVector l) {
    super.setLocation(l);
    lifeSpan = 255;
  }

  public void reset() {
    mLocation.mult(0);
    mVelocity.mult(0);
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

  void run() {
    update();
    display();
  }


  void update() {
    super.update();
    lifeElapse();
  }

  public void lifeElapse() {
    lifeSpan -= 2;
  }

  void display() {
    stroke(0, lifeSpan);
    fill(127, lifeSpan);
    pushMatrix();
    translate(mLocation.x, mLocation.y);
    ellipse(0, 0, mass * 12, mass * 12);

    popMatrix();
  }
}