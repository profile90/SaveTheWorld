

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();

int score = 0;

Player player;
PImage planet;

void setup() {
  planet = loadImage("earth.png");

  player = new Player();

  size(1000, 1000);
  background(50);
  fill(255);


  int numbOfEnemies = 5;
  int numbOfProjectiles = 5;

  for (int i = 0; i < numbOfEnemies; i++) {
    enemies.add(new Enemy());
  }
  for (int i = 0; i < numbOfProjectiles; i++) {
    projectiles.add(new Projectile());
  }
}






void draw() {
  translate(width/2, height/2);
  cursor(CROSS);

  background(50);
  stroke(255);
  fill(255);


  player.drawCanon();
  player.drawPlanet(false);


  noStroke();
  //circle(width/2, width/2, width/20);

  for (Enemy e : enemies) {
    for (Projectile p : projectiles) {
      if(p.hasHit(e)) {
        score++;
        p.disable();
      }
    }
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
