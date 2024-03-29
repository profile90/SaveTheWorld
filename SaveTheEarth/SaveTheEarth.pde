import processing.sound.*;

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Projectile> toBeRemoved = new ArrayList<Projectile>();
int score = 0; 
int numbOfEnemies = 5;
int numbOfProjectiles = 5;


Player player;
PImage background;
PImage planet;
PImage[] astroids;
PFont font;
String text = "Försvara planeten!";
SoundFile pew; 
SoundFile boom;
SoundFile error;

void setup() {
  background = loadImage("space_background.png");
  planet = loadImage("earth.png");
  
  pew = new SoundFile(this, "pew.mp3");
  boom = new SoundFile(this, "boom.mp3");
  error = new SoundFile(this, "error.mp3");
  astroids = new PImage[11];
  
  for(int i = 0; i < astroids.length; i++) {
    astroids[i] = loadImage("astroids/" + i + ".png");
  }

  player = new Player();

  player.projectileImage = new PImage();
  player.projectileImage = loadImage("projectile.png");
  
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
  textFont(font, 16); 
  text("Dina poäng: " + score, 0, -height/5);
}




void draw() {
  translate(width/2, height/2);
  cursor(CROSS);

  background(background);




  for (Enemy e : enemies) {    
    for (Projectile p : projectiles) {  

      if (p.hasHit(e)) {

        if (e.checkAnswer(p.answer)) {
          score++;
          boom.play();
          e.hit = true;
          player.randomize();
          e.randomize();
        }
        else 
        {
          error.play();
        }

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
  
  player.drawCanon();
  player.drawPlanet(false);
  drawText();
}

void endScr() {
}

void mousePressed() {
  player.fire();
}
