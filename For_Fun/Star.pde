class Star  extends Mover {
  Mover mCenter;
  PVector mOrigin;
  float d ;
  float mAngle = 0;
  float mAngleVelocity = 0;
  float radius = 32;  
  float ratio = 0.75;


  public Star(PVector o, float distance, float angle, float vel, float r) {
    mOrigin = o.copy();
    d = distance;
    mAngle = angle;
    mAngleVelocity = vel;
    radius = r;

    mLocation = mOrigin.copy().add(cos(angle) * d, sin(angle) * d);
  }


  public Star(Mover c, float distance, float angle, float vel, float r) {
    mCenter = c;
    d = distance;
    mAngle = angle;
    mAngleVelocity = vel;
    radius = r;

    mLocation = mCenter.mLocation.copy().add(cos(angle) * d, sin(angle) * d);
  }

  public void update() {

    mLocation.mult(0);

    if (mOrigin != null) {
      mLocation.add(mOrigin);
    } else {
      mLocation.add(mCenter.mLocation);
    }

    mLocation.add(cos(mAngle) * d, sin(mAngle) * d);
    mAngle += mAngleVelocity;
  }




  public void display() {
    stroke(255);
    fill(255);

    pushMatrix();
    translate(mLocation.x, mLocation.y);
    ellipse(0, 0, radius * ratio * 2, radius  * ratio *2);

    noFill();
    strokeWeight(2);
    ellipse(0, 0, radius  * 2, radius  * 2);

    popMatrix();
  }
}