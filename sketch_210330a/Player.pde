

class Player {

  int answer;
  int term1;
  int term2;
  PImage  img;
  
  Player() {
      this.img = loadImage("earth.png");
  }
  
  void drawPlanet() {
    image(img, width/2, height/2);
  }
  void drawCanon() {
    
    line(float(width/2), float(height/2), float(mouseX), float(mouseY));
    
  }
  void fire() {
    
  }

  boolean checkAnswer(Enemy e) {
    if(this.answer == e.answer) {
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
