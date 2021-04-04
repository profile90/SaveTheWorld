class Enemy {
  int answer;
  int size = 40;
  float x;
  float y;
  float angle;
  float distanceFromTarget;
  float distance = width/2;
  float killingDistance = width/20;
  float speed = random(1, 2);
  PFont font = createFont("Arial", 16, true);
  boolean hit = false;

  Enemy() {
    randomize();
  }
  

  void randomize() {
    this.hit = false;
    this.distance = width/2 + random(-10, 10);
    this.angle = random(0, 360) * 2 *PI;
    this.x = cos(angle) * width/2;
    this.y = sin(angle) * width/2;
    boolean existAnswer = false;
    for (Enemy e : enemies) {
      if (e.answer == player.answer && e != this) {
        existAnswer = true;
      }
    }

    if (!existAnswer) 
    {
      this.answer = player.answer;
      println("No answer exists, picking from player");
    } else 
    {
      this.answer = int(random(0, 10));
      println("Answer exists, generating random");

    }

 
  }

  void move() {


    this.distanceFromTarget = new PVector(this.x, this.y).mag();    


    distance -= speed / 10;
    this.x = cos(angle) * (distance);
    this.y = sin(angle) * (distance);
  } 

  void drawBody() {
    // some cool animation and stuff    
    image(astroids[this.answer], this.x, this.y);
    
  }


  boolean checkAnswer(int answer) {

    if (this.answer == answer) {
      return true;
    }

    return false;
  }

  void destroy() {
    // play cool animation, remove from list
  }
}
