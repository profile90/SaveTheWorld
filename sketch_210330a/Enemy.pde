class Enemy {
  int answer;
  int size = 40;
  float x;
  float y;
  float angle;
  float distance = width/2;
  float killingDistance = width/20;
  float speed = random(1, 2);
  PFont font = createFont("Arial", 16, true);
  
   


  Enemy() {
    randomize();
  }
  
  void randomize() {

    this.answer = int(random(0, 10))
    ;
    this.distance = width /1.9;
    this.angle = random(0, 360) * 2 *PI;
    this.x = width/2 + cos(angle) * width/2;
    this.y = width/2 + sin(angle) * width/2;
  }

  void move() {
    distance -= speed / 10;
    this.x = width/2 + cos(angle) * (distance);
    this.y = height/2 + sin(angle) * (distance);
  } 

  void drawBody() {
    // some cool animation and stuff
     
    textFont(this.font, 16);
    circle(this.x, this.y, size);
    fill(155);
    text(str(this.answer), this.x, this.y);
    fill(0, 102, 153, 51);
   
  }
  

  boolean checkAnswer(int answer) {

    if (this.answer == answer) {
      this.destroy();
      return true;
    }

    return false;
  }

  void destroy() {
    // play cool animation, remove from list
  }
}
