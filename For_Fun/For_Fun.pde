//This is just a particle system. //<>// //<>//
float distance = 150;
Gear big;
Gear[] gears = new Gear[3];
PVector tempVelocity;
PVector tempLocation = new PVector();
void setup() {
  size(600, 400);
 
  smooth();

  big = new Gear(new PVector(width / 2, height / 2), 0, 0, 0, 32);

  float angle = 0;

  for ( int i = 0; i < gears.length; i ++) {
    gears[i] = new Gear(big.mLocation, distance, angle, -TWO_PI / 400, 16);
    angle += HALF_PI * 4 / 3;
    
  }
}


void draw() {
  background(0);
  
  big.display();
  
  for(int i = 0; i< gears.length; i++){
    
    stroke(255);
    strokeWeight(2);
    line(big.mLocation.x, big.mLocation.y, gears[i].mLocation.x, gears[i].mLocation.y);
    
    gears[i].display();
    gears[i].update(); //<>//
    
  
  }
  
}