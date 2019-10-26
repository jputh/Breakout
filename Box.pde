/* 
This class represents a rectangle (also a square).
The Box disappears when the Ball collides into it .
Feel free to add any helper methods/functions necessary.
*/

class Box {
 //Declare class variables/members necessary for a Box
 public color boxColor;
 public boolean isVisible;
 public float xLoc;
 public float yLoc;
 public float boxLength = 25;
 public int value;
 

//Constructor
 Box(int x, int y, color c, int val){
   xLoc = x;
   yLoc = y;
   boxColor = c;
   value = val;
   isVisible = true;
  
 }
 
   //Perform actions necessary to update the current frame of the Box
  void update(){
    
      //isVisible = false;
      
  }
 
 //Draws the current location of the Box (rectangle/square) [or hides it] after update() is processed
 void draw(){
   
   if(isVisible){
     fill(boxColor);
     rect(xLoc, yLoc, boxLength, boxLength);
   }
   
 }
 
 void invisible(){
   isVisible = false;
 }
 
 void visible(){
   isVisible = true;
 }
 
}
