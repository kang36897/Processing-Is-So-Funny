interface Recycler<T extends Particle> {
  boolean isEmpty();

  void recycle(Particle p);

  T get();
  
  void clear();
}