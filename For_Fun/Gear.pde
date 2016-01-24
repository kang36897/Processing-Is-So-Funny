class Gear { //<>//
  PVector mOrigin;
  float d ;
  float mAngle = 0;
  float mAngleVelocity = 0;
  float radius = 32;  
  float ratio = 0.75;
  
  PVector mLocation;

  public Gear(PVector o, float distance, float angle, float vel, float r) {
    mOrigin = o.copy();
    d = distance;
    mAngle = angle;
    mAngleVelocity = vel;
    radius = r;
    
    mLocation = mOrigin.copy().add(cos(angle) * d, sin(angle) * d);
  }


  public void update(){
    
    mLocation.mult(0);
    mLocation.add(mOrigin); //<>//
    mLocation.add(cos(mAngle) * d, sin(mAngle) * d); //<>//
    mAngle += mAngleVelocity; //<>//
  }

  


  public void display() {
    stroke(255);
    fill(255);
 
    pushMatrix();
    translate(mLocation.x, mLocation.y);
    ellipse(0, 0, radius * ratio * 2, radius  * ratio *2);

    noFill();
    strokeWeight(2);
    ellipse(0, 0, radius  * 2, radius  * 2);

    popMatrix();
  }
}