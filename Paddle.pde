/* 
This class represents a rectangle.
It can also handle movement via keyboard input.
Feel free to add any helper methods/functions necessary.
*/

class Paddle {
//Declare class variables/members like position, velocity, size, speed, etc.
  public int xLoc = 350;
  public int yLoc = 680;
  public int xVel = 0;
  
  //Constructor
  Paddle(/* possible parameters needed to create a Paddle */){

  }
  
  
  //Perform actions necessary to update the current frame of the Paddle
  void update(){
    
    xLoc += xVel;

    //if(xLoc + 75 + moveLoc <= width - 1 && xLoc - 75 + moveLoc >= 1){
    //  xLoc += moveLoc;
    //}
  }
  
  
  //Draws the current location of the Paddle (rectangle) after update() is processed
  void draw(){
    
    rectMode(CENTER);
    fill(0);
    rect(xLoc, yLoc, 150, 20);
  }

}
