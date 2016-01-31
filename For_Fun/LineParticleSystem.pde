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

    if (segmentCount % 4 == 0) {
      if (mRecycler.isEmpty()) {
        mSegment = new LineParticle();
      } else {
        mSegment = (LineParticle)mRecycler.get();
        mSegment.reset();
      }

      if (mLastPostion != null) {
        mSegment.addVetex(mLastPostion);
      } else {
        mSegment.addVetex(mEmitter.mLocation);
      }
    } else if (segmentCount % 4 == 3) {

      mLastPostion = mEmitter.mLocation.copy();
      mSegment.addLastVetex(mLastPostion);
      mParticles.add(mSegment);
    } else {
      mSegment.addVetex(mEmitter.mLocation);
    }


    segmentCount ++ ;
  }
}