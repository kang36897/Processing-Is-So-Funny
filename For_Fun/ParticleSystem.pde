class ParticleSystem {
  PVector mOrigin;
  NormalRecycler mRecycler;

  ArrayList<Particle> mParticles;

  public ParticleSystem(PVector l) {
    mOrigin = l.copy();

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
      newBorn = new Particle(mOrigin);
    } else {
      newBorn = mRecycler.get();
      newBorn.setLocation(mOrigin);
    }

    mParticles.add(newBorn);
  }

  public void run() {
    for (int i = mParticles.size() - 1; i >= 0; i--) {

      Particle p = mParticles.get(i);
      p.display();
      p.update();

      if (p.isDead()) {
        mParticles.remove(i);
      }
    }
  }
}