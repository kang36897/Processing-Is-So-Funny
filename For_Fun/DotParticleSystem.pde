class DotParticleSystem extends ParticleSystem {

  public DotParticleSystem(PVector l) {
    super(l);
  }

  public DotParticleSystem(Mover m) {
    super(m);
  }

  public void addParticle() {
    Particle newBorn;

    if (mRecycler.isEmpty()) {
      newBorn = new DotParticle(mEmitter.mLocation);
    } else {
      newBorn = mRecycler.get();
      newBorn.setLocation(mEmitter.mLocation);
    }
    newBorn.mVelocity.mult(0);
    mParticles.add(newBorn);
  }
}