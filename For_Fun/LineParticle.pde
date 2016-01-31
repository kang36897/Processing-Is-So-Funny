class LineParticle extends Particle {

  ArrayList<PVector> mPoints;

  float sw = 1;
  public LineParticle(ArrayList<PVector> dots) {
    mPoints = dots;
  }

  public LineParticle() {
    super(new PVector());
    mPoints = new ArrayList<PVector>();
  }

  public void addVetex(PVector dot) {
    mPoints.add(dot.copy());
  }

  public void addLastVetex(PVector dot) {
    int length = mPoints.size();
    PVector tail2 = mPoints.get(length - 1);
    PVector d = PVector.sub(dot, tail2) ;
    float distance = d.mag();
    distance -= sw;
    d.normalize();
    d.mult(distance);
    PVector tail1 = d.add(tail2);
    addVetex(d);
  }

  public void reset() {
    super.reset();
    mPoints.clear();
  }

  public void lifeElapse() {
    lifeSpan -= 1;
  }

  public void display() {

    noFill();
    stroke(255, lifeSpan);
    strokeWeight(sw);
    beginShape();
    PVector p = mPoints.get(0);
    vertex(p.x, p.y);
    for (int i = 1; i < mPoints.size(); i += 3) {

      bezierVertex(mPoints.get(i).x, mPoints.get(i).y, mPoints.get(i +1).x, mPoints.get(i+1).y, mPoints.get(i +2).x, mPoints.get(i+2).y);
    }
    endShape();
  }
}