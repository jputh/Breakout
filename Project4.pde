import controlP5.*;

//Objects declared to create the UI (ControlP5) and GameState
ControlP5 cp5;
GameState gs;
Button reset;



//Initalize window settings, objects, etc. to start the game 
void setup(){
  
  size(700, 700);
  background(255);
  
  gs = new GameState();
  
  cp5 = new ControlP5(this);
  reset = cp5.addButton("Reset").setPosition(10, 10).setSize(50, 50);
     
}


//Updates the GameState every frame
void draw() {
  
  background(255);
  
  gs.update();
  gs.draw();
  
  
  
  
}


//Handles when keyboard input is pressed
void keyPressed(){
  gs.keyPressed();
}


//Handles when keyboard input is released
void keyReleased(){
  gs.keyReleased();
}


public void Reset(){
  
  for(Box b : gs.grid){
    b.visible();
  }
  
  gs.score = 0;
  
  gs.myBall.reset();
  
  gs.pad.reset();
}
