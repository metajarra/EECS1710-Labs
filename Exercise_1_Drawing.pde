// colour changes over time
// colour changes more quickly with speed
// size changes with speed


color bg = color(0, 0, 0); // sets background colour (black)x
color brush = color(255, 0, 0); // sets initial brush colour (red)

int brushR = 255; // represents the amount of red (in RGB terms)
int brushG = 0;  // represents the amount of green (in RGB terms)
int brushB = 0;  // represents the amount of blue (in RGB terms)
 
float brushDiameter; // the diameter of the brush (will change over time)
float speed; // the speed of the brush's motion (between this and last frame)

void setup(){ // sets window size and background colour
  size(1024, 768);
  background(bg);
}

void draw(){
  if(mousePressed){ // only called if mouse is currently being held
    ellipseMode(CENTER); // we are drawing ellipses
    
    int a = abs(mouseX - pmouseX); // the "A" component of the Pythagorean theorem (represents distance travelled in the X dimension in absolute terms)
    int b = abs(mouseY - pmouseY); // the "B" component of the Pythagorean theorem (represents distance travelled in the Y dimension in absolute terms)
    
    speed = sqrt((a * a) + (b * b)); // application of Pythagorean theorem, determines true distance travelled between this and last frame
    speed = constrain(speed, 1, 16); // in order to keep colour change rate and brush size manageable, speed is constrained to never be 0 and never exceed 16

    brushDiameter = speed + 14; // sets diameter of brush. minimum is 15, maximum is 30

    // overcomplicated colour switcher STARTS
    
    if(brushR == 255 && brushB == 0){ // if between red and yellow
      brushG += speed; // moves colour towards yellow
      if(brushG > 255){
        brushG = 255;
      }
    }
    
    if(brushG == 255 && brushB == 0){ // if between yellow and green
      brushR -= speed; // moves colour towards green
      if(brushR < 0){
        brushR = 0;
      }
    }
    
    if(brushG == 255 && brushR == 0){ // if between green and light blue
      brushB += speed; // moves colour towards light blue
      if(brushB > 255){
        brushB = 255;
      }
    }
    
    if(brushB == 255 && brushR == 0){ // if between light blue and dark blue
      brushG -= speed; // moves colour towards dark blue
      if(brushG < 0){
        brushG = 0;
      }
    }
    
    if(brushB == 255 && brushG == 0){ // if between dark blue and purple
      brushR += speed; // moves colour towards purple
      if(brushR > 255){
        brushR = 255;
      }
    }
    
    if(brushR == 255 && brushG == 0){ // if between purple and red
      brushB -= speed; // moves colour towards red
      if(brushB < 0){
        brushB = 0;
      }
    }
    
    print(brushR, brushG, brushB, "\n"); // prints RGB components
    
    brush = color(brushR, brushG, brushB); // sets colour of the brush to be the newly created RGB components
    fill(brush);
    
    // overcomplicated colour switcher ENDS
     
    ellipse(mouseX, mouseY, brushDiameter, brushDiameter); // draws circle
  }
}
