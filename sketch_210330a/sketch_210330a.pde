

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Projectile> toBeRemoved = new ArrayList<Projectile>();
int score = 0; 
int numbOfEnemies = 5;
int numbOfProjectiles = 5;

Player player;
PImage background;
PImage planet;


void setup() {
  background = loadImage("space_background.png");
  planet = loadImage("earth.png");

  player = new Player();

  size(1000, 1000);

  for (int i = 0; i < numbOfEnemies; i++) {
    enemies.add(new Enemy());
  }
}


void draw() {
  translate(width/2, height/2);
  cursor(CROSS);

  background(background);
  stroke(255);
  fill(255);

  player.drawCanon();
  player.drawPlanet(false);


  noStroke();
  //circle(width/2, width/2, width/20);

  for (Enemy e : enemies) {
    for (Projectile p : projectiles) {     
      if(p.hasHit(e)) {
        if(e.checkAnswer(p.answer)){
          score++;
        }
        
        println(score);
        toBeRemoved.add(p);
      }
      p.move();
    }
    
    for(Projectile p : toBeRemoved) {
      projectiles.remove(p); 
    }
    
    toBeRemoved.clear();
    
    if (e.distance < e.killingDistance) {
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
  player.fire();
}
