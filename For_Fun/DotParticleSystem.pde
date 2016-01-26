class DotParticleSystem extends ParticleSystem {

  int eggCount = 0;
  public DotParticleSystem(PVector l) {
    super(l);
  }

  public DotParticleSystem(Mover m) {
    super(m);
  }

  public void addParticle() {
    if (eggCount % 7 != 0) {
      eggCount ++;
      return;
    }

    Particle newBorn;

    if (mRecycler.isEmpty()) {
      newBorn = new DotParticle(mEmitter.mLocation);
    } else {
      newBorn = mRecycler.get();
      newBorn.setLocation(mEmitter.mLocation);
    }
    newBorn.mVelocity.mult(0);
    mParticles.add(newBorn);

    eggCount ++ ;
  }
}