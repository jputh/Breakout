/* 
This class represents a circle or ellipse; which also has movement via velocity.
Has functions/methods on how to collide with: (1) Paddle and (2) Box objects.
Feel free to add any helper methods/functions necessary.
*/

class Ball {
  //Declare class variables/members like position, velocity, diameter, speed, etc.
  public float xLoc;
  public float yLoc;
  public float rad;
  
  public int xVel;
  public int yVel;


  //Constructor
  Ball(/* possible parameters needed to create a Ball */){
    //Initialize variables needed to create a ball
    xLoc = width/2;
    yLoc = height - 150;
    xVel = 0;
    yVel = -2;
    rad = 20;
    
  }
  
  Ball(float x, float y, int xV, int yV){
    xLoc = x;
    yLoc = y;
    xVel = xV;
    yVel = yV;
    rad = 20;
  }
  
  
  //Perform actions necessary to update the current frame of the Ball
  void update(){
    
    xLoc += xVel;
    yLoc += yVel;

  }
  
  
  //Helper function to process Ball-Paddle collisions
  void collide_paddle(Paddle thePaddle){
    
    float dX = xLoc - max(thePaddle.xLoc - 75, min(xLoc, thePaddle.xLoc + 75));
    float dY = yLoc - max(thePaddle.yLoc - 10, min(yLoc, thePaddle.yLoc + 10));
      
      if( (dX * dX + dY * dY) < ((rad/2) * (rad/2)) ){
        
        if(xLoc >= thePaddle.xLoc - 75 && xLoc < thePaddle.xLoc - 25){
          xVel = -2;
          yVel = -2;
        }
        else if(xLoc >= thePaddle.xLoc - 25 && xLoc < thePaddle.xLoc + 25){
          xVel = 0;
          yVel = -2;
        }
        else{
          xVel = 2;
          yVel = -2;
        }
        
     }
  }


  //Helper function to process Ball-Box collisions
  boolean collide_box(Box theBox){
    
    if(theBox.isVisible){
      
      float dX = xLoc - max(theBox.xLoc - theBox.boxLength/2, min(xLoc, theBox.xLoc + theBox.boxLength/2));
      float dY = yLoc - max(theBox.yLoc - theBox.boxLength/2, min(yLoc, theBox.yLoc + theBox.boxLength/2));
      
      if( (dX * dX + dY * dY) < ((rad/2) * (rad/2)) ){
        
        System.out.println("collision detected " + xLoc + " " + yLoc);
        theBox.invisible();
        
        if(xLoc > theBox.xLoc){
          xVel = 2;
        }
        if(xLoc < theBox.xLoc){
          xVel = -2;
        }
        if(yLoc > theBox.yLoc){
          yVel = 2;
        }
        if(yLoc < theBox.yLoc){
          yVel = -2;
        }
        
        return true;
        
      }
      
    }
    
    return false;
  }
 
 
 //Helper function to process Ball-Wall collisions (left, top, & right wall boundaries)
  void collide_wall(){
    
    if(xLoc - rad/2 <= 1 | xLoc + rad/2 >= width - 1){
      xVel *= -1;
    }
    
    if(yLoc - rad/2 <= 1 ){
      yVel *= -1;
    }
      
  }
  
  //reset ball location and velocity
  void reset(){
    xLoc = width/2;
    yLoc = height - 150;
    xVel = 0;
    yVel = -2;
  }
  
  
  //Draws the current location of the Ball (circle or ellipse) after update() is processed 
  void draw (){
    
    fill(255);
    ellipse(xLoc, yLoc, rad, rad);
    
  }
  
}
