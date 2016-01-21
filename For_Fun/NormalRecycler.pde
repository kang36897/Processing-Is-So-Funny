class NormalRecycler implements Recycler<Particle> {
  final  Particle DUMMY = new Particle();
  Particle mBin;

  public NormalRecycler() {
    mBin = DUMMY;
  }

  public boolean isEmpty() {
    if (mBin == DUMMY) {
      return true;
    }

    return false;
  }

  public void recycle(Particle p) {
    Particle temp = mBin;
    mBin = p;
    p.mNext = temp;
  }


  public Particle get() {
    if (isEmpty()) {
      return null;
    }

    Particle temp = mBin;
    mBin = temp.mNext;
    temp.mNext = null;

    return temp;
  }

  public void clear() {
    if (isEmpty()) {
      return;
    }

    Particle temp = mBin.mNext;
    while (temp != DUMMY) {
      temp = temp.mNext;
    }
    mBin = temp;
  }
}