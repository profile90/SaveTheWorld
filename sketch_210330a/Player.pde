class Player {

  int answer;
  int term1;
  int term2;
  
  int currentProjectile = 0;
  
  PVector canon;
  PVector center;
  
  Player() {
    center = new PVector(width/2, height/2);
    canon = new PVector(mouseX, mouseY);
  }

  void drawCanon() {
    
    // VECTOR MATH GO BRR
    canon.x = mouseX;
    canon.y = mouseY; 
    canon.sub(center);
    canon.normalize();
    canon.mult(75);
    
    strokeWeight(3);
    line(0, 0, canon.x, canon.y);
    
    
    
  }
  void fire() {
    
    fill(255);
    circle(canon.x, canon.y, 20);
 
    projectiles.add(new Projectile(canon, answer));
    println(projectiles);
  }
  
  void drawPlanet(boolean damage) {
    imageMode(CENTER);
    image(planet, 0, 0, 177, 85);
    
    if(damage) 
    {
      tint(255, 0, 0);
    }
    else 
    {
     tint(255, 255, 255);
    }
  }

  boolean checkAnswer(Enemy e) {
    if(this.answer == e.answer) 
    {
      return true;
    }
    else 
    {
      return false;
    }
    
  }
  
  void randomize() {
    
    this.answer = int(random(1, 10));
    this.term1 = int(random(1, answer));
    
    if(this.term1 == this.answer) {
       this.term2 = 0;  
    }
    
    this.term2 = answer - term1;
    
    
  }
}
