import controlP5.*;
/* 
This class is the brains of the game.
Handles how the game is run especially interactions between the Ball, Paddle, and Box objects.
Feel free to add any helper methods/functions necessary.
*/

class GameState {
  
  
 //Declare class variables/members necessary to help with running the game
  
 //Declare class objects for the game: a Ball, Paddle, collection of Boxes, etc.
 Paddle pad;
 Box [] grid;
 Ball myBall;
 Ball b2;
 Ball b3;
 int score;
 boolean pause;
 


 color c0 = #264653;
 color c1 = #2A9D8F;
 color c2 = #E9C46A;
 color c3 = #F4A261;
 color c4 = #E76F51;
 color c5 = #FF6961;
 color [] boxColors = {c0, c1, c2, c3, c4, c5};
 
 

//Constructor
  GameState(/* possible parameters needed to create a GameState */){

     
    pad = new Paddle();
    grid = new Box[60];
    myBall = new Ball();
    score = 0;
    pause = false;
    
    b2 = new Ball(100, 300, 1, 0);
    b3 = new Ball(300, 100, 0, 1);
    
    int yBuffer = 400;
    for(int i = 0; i < 6; i++){
      color boxFill = boxColors[i];
      
      
      for(int j = 0; j < 10; j++){
        grid[i*10 + j] = new Box(j*35 + 200, yBuffer, boxFill, i+1);
      }
      
      yBuffer -= 35; 
    }
        //<>//
  } //<>//


//Call update() on respective game objects: Ball, Box(es), and/or Paddle
//Handle interactions of current state of game at every frame
  void update(){
    
    //update paddle
    pad.update();
    
    //check for ball-box collisions
    for(Box b : grid){
      
      if(myBall.collide_box(b)){
        score += b.value;
      }
      
      //b2.collide_box(b);
      //b3.collide_box(b);
    }
    
    
    //check for collision with wall
    myBall.collide_wall();
    
    //check for collision with paddle
    myBall.collide_paddle(pad);
    
    //move ball position
    myBall.update();
    
    
    //b2.collide_paddle(pad);
    //b3.collide_paddle(pad);
    //b2.update();
    //b3.update();

  }
  
  //Draws the current state of the Game
  void draw(){
    
    //draw paddle
    pad.draw();
    
    //draw box grid
    for(int i = 0; i < 60; i++){
      grid[i].draw();
    }
    
    
    //draw ball
    myBall.draw();
    
    //b2.draw();
    //b3.draw();
    
    textSize(24);
    fill(0);
    text("Score: " + score, 310, 100);
    
    if(myBall.yLoc > height - 10){
      lose();
    }
    
    if(score == 210){
      win();
    }
    

  }
  
  //Handles what happens when specific keys on the keyboard is pressed
  void keyPressed(){
    
    if(key == 'a'){
      pad.xVel = -3;
    }
    else if(key == 'd'){
      pad.xVel = 3;
    }
    else if(key == 'p'){
      pause = !pause;
      
      if(pause){
        noLoop();
      }
      else{
        loop();
      }
    }
    
  }
  
  
  //Handles what happens when specific keys on the keyboard is released
  void keyReleased(){
    
    pad.xVel = 0;
  }
  
  
  void lose(){
    fill(195, 40, 30);
    rect(width/2, height/2, 700, 700);
    
    fill(255, 255, 255);
    textSize(24);
    text("You Lost!", 300, 400);
  }
  
  
  void win(){
    
    fill(145, 195, 83);
    rect(width/2, height/2, 700, 700);
    
    fill(255, 255, 255);
    textSize(24);
    text("You Won!", 300, 400);
  }
}




  
