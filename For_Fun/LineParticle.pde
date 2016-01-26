class LineParticle extends Particle {

  ArrayList<PVector> mPoints;


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
    beginShape();
    for (int i = 0; i < mPoints.size(); i ++) {
      PVector p = mPoints.get(i);
      vertex(p.x, p.y);
    }
    endShape();
  }
}