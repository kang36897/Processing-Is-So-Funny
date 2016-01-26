class LineParticleSystem extends ParticleSystem {
  int segmentCount = 0;
  LineParticle mSegment;
  PVector mLastPostion;
  public LineParticleSystem(PVector l) {
    super(l);
  }

  public LineParticleSystem(Mover m) {
    super(m);
  }

  public void addParticle() {

    if (segmentCount % 2 == 0) {
      if (mRecycler.isEmpty()) {
        mSegment = new LineParticle();
      } else {
        mSegment = (LineParticle)mRecycler.get();
        mSegment.reset();
      }

      if (mLastPostion != null) {
        mSegment.addVetex(mLastPostion);
      }
    } else if (segmentCount % 2 == 1) {

      mLastPostion = mEmitter.mLocation.copy();
      mSegment.addVetex(mLastPostion);
      mParticles.add(mSegment);
    } else {
      mSegment.addVetex(mEmitter.mLocation);
    }


    segmentCount ++ ;
  }
}