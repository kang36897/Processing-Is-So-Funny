class ParticleSystem {
  Emitter mEmitter;
  NormalRecycler mRecycler;

  ArrayList<Particle> mParticles;

  public ParticleSystem(PVector l) {
    mEmitter = new Emitter(l);

    mRecycler = new NormalRecycler();
    mParticles = new ArrayList<Particle>();
  }

  public ParticleSystem(Emitter m) {
    mEmitter = m;
    mRecycler = new NormalRecycler();
    mParticles = new ArrayList<Particle>();
  }


  public void applyForce(PVector force) {
    for (Particle p : mParticles) {
      p.applyForce(force);
    }
  }


  public void addParticle() {
    Particle newBorn;

    if (mRecycler.isEmpty()) {
      newBorn = new Particle(mEmitter.mLocation);
    } else {
      newBorn = mRecycler.get();
      newBorn.setLocation(mEmitter.mLocation);
    }

    mParticles.add(newBorn);
  }

  public void run() {
    addParticle();
    for (int i = mParticles.size() - 1; i >= 0; i--) {

      Particle p = mParticles.get(i);
      p.run();

      if (p.isDead()) {
        mParticles.remove(i);
      }
    }
  }
}