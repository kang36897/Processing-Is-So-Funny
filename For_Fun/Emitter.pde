class Emitter extends Mover {
  public Emitter(PVector l) {
    super(l);
  }

  public Emitter(PVector l, PVector v) {
    super(l);
    mVelocity.set(v.x, v.y);
  }

  public void display() {
    //does not show anything
  }
}