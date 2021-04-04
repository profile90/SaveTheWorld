class Projectile {
  
  boolean enabled = false;
  int size = 5;
  PVector trejectory = new PVector(0,0);
  PVector location = new PVector(0,0);  
  PVector acceleration = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  int topSpeed = 10;
  int answer;
  
  
  Projectile(PVector trejectory, int answer) {
      this.answer = answer;
      this.trejectory = trejectory;
      this.acceleration = PVector.sub(trejectory, location);
      location.x = trejectory.x;
      location.y = trejectory.y;

  }  
  
  boolean hasHit(Enemy e) {
    PVector enemyPos = new PVector(e.x, e.y);
    
    enemyPos.sub(location);
    
    if(enemyPos.mag() < e.size + this.size) {
      return true;
    }
    
    return false;
  }

  void move() {
    acceleration.setMag(0.02);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    image(player.projectileImage, location.x, location.y);
  }
}
