class Star  extends Mover { //<>// //<>// //<>//
  Star mCenter;
  PVector mOrigin;
  float d ;
  float mAngle = 0;
  float mAngleVelocity = 0;
  float radius = 32;  
  float ratio = 0.75;

  boolean isShown = false;
  ArrayList<Star> mSatellites = new ArrayList<Star>();

  ParticleSystem mps;

  public Star(PVector o, float distance, float angle, float vel, float r) {
    mOrigin = o.copy();
    d = distance;
    mAngle = angle;
    mAngleVelocity = vel;
    radius = r;

    mLocation = mOrigin.copy().add(cos(angle) * d, sin(angle) * d);
  }

  public void showSatelliteOrbit(boolean value) {
    isShown = value;
  }


  public Star(Star c, float distance, float angle, float vel, float r) {
    mCenter = c;
    d = distance;
    mAngle = angle;
    mAngleVelocity = vel;
    radius = r;

    mLocation = mCenter.mLocation.copy().add(cos(angle) * d, sin(angle) * d);
  }

  public void attached(ParticleSystem ps) {
    mps = ps;
    mps.mEmitter = this;
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

    for (Star s : mSatellites) {
      s.update();
    }
  }


  public void addSatellite(Star s) {
    mSatellites.add(s);
  }

  public void removeSatellite(Star s) {
    if (mSatellites.isEmpty()) {
      return;
    }

    mSatellites.remove(s);
  }

  public void orbit(Star m) {
    if (mOrigin != null) {
      mOrigin = null;
    } else {
      mCenter.removeSatellite(this);
    }

    mCenter = m;
    mCenter.addSatellite(this);


    update();
  }

  public void displaySatellite() {
    stroke(255);
    strokeWeight(2);
    for (Star s : mSatellites) {
      line(mLocation.x, mLocation.y, s.mLocation.x, s.mLocation.y);
      s.display();
    }
  }


  public void run() {
    update();
    display();
  } 

  public void displaySatelliteOrbit() {
    if (!isShown) {
      return;
    }

    stroke(255, 80);
    strokeWeight(1);
    for (Star s : mSatellites) {
      ellipse(mLocation.x, mLocation.y, s.d * 2, s.d * 2);
    }
  }

  public void display() {
    displayParticleSystem();
    displaySelf();
    displaySatelliteOrbit();
    displaySatellite();
  }

  public void displaySelf() {
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

  public void displayParticleSystem() {
    if (mps == null) {
      return;
    }

    mps.run();
  }
}