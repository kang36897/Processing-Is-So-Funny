class SpecialStar extends Star {

  public SpecialStar(PVector o, float distance, float angle, float vel, float r) {
    super(o, distance, angle, vel, r);
    ratio = 0.6;
  }

  public SpecialStar(Star c, float distance, float angle, float vel, float r) {
    super(c, distance, angle, vel, r);
  }

  public void displaySelf() {
    stroke(255);
    fill(255);

    pushMatrix();
    translate(mLocation.x, mLocation.y);
    ellipse(0, 0, radius * ratio * 2, radius  * ratio *2);

    noFill();
    strokeWeight(1);
    float start =  mAngle - PI / 6;
    float stop = start + PI/3;
    arc(0, 0, radius  * 2, radius  * 2, start, stop);

    start = mAngle + PI - PI / 6;
    stop = start + PI/3;
    arc(0, 0, radius  * 2, radius  * 2, start, stop);
    popMatrix();
  }
}