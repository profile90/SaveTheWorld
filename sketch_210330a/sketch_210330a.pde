

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Projectile> toBeRemoved = new ArrayList<Projectile>();
int score = 0; 
int numbOfEnemies = 5;
int numbOfProjectiles = 5;


Player player;
PImage background;
PImage planet;
PFont font;
String text = "Försvara planeten!";


void setup() {
  background = loadImage("space_background.png");
  planet = loadImage("earth.png");

  player = new Player();

  size(1000, 1000);

  for (int i = 0; i < numbOfEnemies; i++) {
    enemies.add(new Enemy());
  }

  font = createFont("Arial", 16, true);
}



void drawText() {
  textFont(font, 32); 
  textAlign(CENTER);
  text(text, 0, -height/4);
  text(score, width/4, -height/4);
}



void draw() {
  translate(width/2, height/2);
  cursor(CROSS);

  background(background);
  stroke(255);
  fill(255);

  player.drawCanon();
  player.drawPlanet(false);
  drawText();
  noStroke();

  for (Enemy e : enemies) {    

    for (Projectile p : projectiles) {  

      if (p.hasHit(e)) {

        if (e.checkAnswer(p.answer)) {
          score++;
          e.hit = true;
          player.randomize();
          e.randomize();
        }

        println(score);    
        toBeRemoved.add(p);
      }

      if (p.location.mag() > width) {
        toBeRemoved.add(p);
      }

      p.move();
    }

    for (Projectile p : toBeRemoved) {
      projectiles.remove(p);
    }

    toBeRemoved.clear();

    if (e.distance < e.killingDistance) {
      player.health--;
      player.drawPlanet(true);

      if (player.health == 0) {
        endScr();
      }

      e.x = 0;
      e.y = 0;
      e.randomize();
    }

    e.drawBody();
    e.move();
  }
}

void endScr() {
}

void mousePressed() {
  player.fire();
}
