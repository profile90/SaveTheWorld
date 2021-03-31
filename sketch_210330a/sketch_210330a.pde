

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Player player;
void setup() {
  
  player = new Player();
  
  size(1000, 1000);
  background(50);
  fill(255);
  
  
  int numbOfEnemies = 5;
  
  for(int i = 0; i < numbOfEnemies; i++) {
    enemies.add(new Enemy());
  }


}


void draw() {
    cursor(CROSS);
    background(50);
  stroke(255);
  fill(255);
  
  player.drawCanon();
  
  noStroke();
  //circle(width/2, width/2, width/20);

   
  
  
  for(Enemy e : enemies) {
     if(e.distance < e.killingDistance) {
       e.x = 0;
       e.y = 0;
       e.randomize();
       // create point counting system
       
       
     }
    e.drawBody();
    e.move();    
  }


}

void mousePressed() {
    for(Enemy e : enemies) {
      e.randomize(); 
    }
}
