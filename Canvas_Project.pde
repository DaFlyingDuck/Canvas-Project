color white     = 255;
color black     = 0;
color dark_grey = #3E4147;
color grey      = #808080;
color lime      = #AAFF00;
color orange    = #FFAA00;
color pink      = #FF00AA;
color purple    = #AA00FF;
color blue      = #00AAFF;
color turqouise = #00FFAA;


color stroke1 = grey;
color stroke2 = grey;
color stroke3 = grey;
color stroke4 = grey;
color stroke5 = grey;
color stroke6 = grey;

color selectedColor = lime;

PVector Circle1 = new PVector(50, 670);
PVector Circle2 = new PVector(125, 700);
PVector Circle3 = new PVector(200, 670);
PVector Circle4 = new PVector(275, 700);
PVector Circle5 = new PVector(350, 670);
PVector Circle6 = new PVector(435, 700);
PVector Mouse;

PVector Slider = new PVector(580, 687);

PImage Slayer;
PVector Stamp = new PVector(750, 634.5);
Boolean StampOn = false;

PImage Eraser;
PVector Erase = new PVector(845, 667); 
Boolean EraserOn = false;


void setup() {
  size(1000, 750);
  background(white);
  frameRate(100);
  Slayer = loadImage("Durian_Slayer.PNG");
  Eraser = loadImage("Eraser.png");
  
}


void draw() {
  fill(dark_grey);
  noStroke();
  rect(0, 625, 1000, 125);
  Mouse = new PVector(mouseX, mouseY);
  Slider = new PVector(Slider.x, 687);
  
  
  // Colored Circles
  strokeWeight(4);
  Circle_button(lime, stroke1, Circle1);
  Circle_button(orange, stroke2, Circle2);
  Circle_button(pink, stroke3, Circle3);
  Circle_button(purple, stroke4, Circle4);
  Circle_button(blue, stroke5, Circle5);
  Circle_button(turqouise, stroke6, Circle6);
  
  
  //Slider
  Slider();
  
  
  //Indicator
  fill(selectedColor);
  stroke(selectedColor);
  if (StampOn == false && EraserOn == false) {
    circle(710, 687, (Slider.x - 480) / 10);
  } else if (StampOn == true) {
    image(Slayer, 690, 657, 40, 60);
  } else if (EraserOn = true) {
    image(Eraser, 690, 667, 40, 40);
  }
  
  // Slayer Stamp
  Stamp();
  
  // Eraser
  Eraser();

  // New Button
  New_Button();
  
  //Load Button
  Load_Button();
  
  //Save Button
  Save_Button();
}



void mouseDragged() { // code to draw line
  
  drawing();
  sliderControl();

}

void mouseReleased() { 
  
  // if the mouse is near the slider it is afffected
  sliderControl();
  stampControl();
  eraserControl();
  
}

void mouseClicked() { // activates when the mosue is clicked
  
  // checks to see if the mouse is clicking circle
  TouchingCircle(lime, Circle1, stroke1);
  TouchingCircle(orange, Circle2, stroke2);
  TouchingCircle(pink, Circle3, stroke3);
  TouchingCircle(purple, Circle4, stroke4);
  TouchingCircle(blue, Circle5, stroke5);
  TouchingCircle(turqouise, Circle6, stroke6);
  
  stampControl();
  eraserControl();
  new_buttonControl();
  load_buttonControl();
  save_buttonControl();
  
  drawing();
  
}



// Function for drawing with mouse

void drawing() {
  
  if (mouseY < 630 && StampOn == false && EraserOn == false) {
  
    stroke(selectedColor);
    fill(selectedColor);
    strokeWeight((Slider.x - 480) / 10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  
  } else if (mouseY < 630 && StampOn == true) {
    
    stroke(selectedColor); 
    image(Slayer, mouseX - 35, mouseY - 52.5, 70, 105);
    
  } else if (mouseY < 630 && EraserOn == true) {
  
    stroke(white);
    fill(white);
    strokeWeight((Slider.x - 480) / 10);
    line(pmouseX, pmouseY, mouseX, mouseY);
    
  }
  
}

// Circular Buttons for color

void Circle_button(color fill, color stroke, PVector Circle) { // Function for the circular buttons 
 
  stroke(grey);
  fill(fill);
  PVector d = PVector.sub(Mouse, Circle);
  if (d.mag() <= 27.5) {
    stroke(white);
  }
  circle(Circle.x, Circle.y, 55);
  
}



void TouchingCircle(color b, PVector circle, color c) { // a = 0 is clicked, a = 1 is hovering // for b: number corresponds to circle color
    
  PVector d = PVector.sub(Mouse, circle);
  strokeWeight(3);
  if (d.mag() <= 27.5) {

     selectedColor = b;
     strokeWeight(5);
     StampOn = false;
     EraserOn = false;
  
  }
  
}

// Slider

void Slider() {
  
  strokeWeight(4);
  stroke(grey);
  line(500, 687, 660, 687);
  PVector d = PVector.sub(Mouse, Slider);
  if (d.mag() <= 27.5) {
    stroke(white);
  }
  fill(grey);
  circle(Slider.x, Slider.y, 37);
  
  
}


void sliderControl() {
  
   if (mouseX >= 500 && mouseX <= 660 && mouseY >= 660 && mouseY <= 714 ) {
    
     Slider.x = mouseX;
   
   }
  
}


// Stamps

void Stamp() {
  
  fill(black);
  strokeWeight(2);
  stroke(black);
  if (mouseX >= 750 && mouseX <= 820 && mouseY >= 634 && mouseY <= 739) {
    stroke(white);
  }
  rect(745, 629.5, 80, 115);
  image(Slayer, Stamp.x, Stamp.y, 70, 105);
  
}


void Eraser() {
  
  fill(black);
  strokeWeight(2);
  stroke(black);
  if (mouseX >= 845 && mouseX <= 885 && mouseY >= 662 && mouseY <= 702) {
    stroke(white);
  }
  rect(840, 662, 50, 50);
  image(Eraser, Erase.x, Erase.y, 40, 40);
  
}

void New_Button() {
  
  fill(black);
  strokeWeight(2);
  stroke(black);
  if (mouseX >= 910 && mouseX <= 980 && mouseY >= 635 && mouseY <= 660) {
    stroke(white);
  }
  rect(910, 635, 70, 25);
  textSize(18);
  textAlign(CENTER, CENTER);
  fill(white);
  text("NEW", 945, 645);
  
}

void Load_Button() {
  
  fill(black);
  strokeWeight(2);
  stroke(black);
  if (mouseX >= 910 && mouseX <= 980 && mouseY >= 675 && mouseY <= 700) {
    stroke(white);
  }
  rect(910, 675, 70, 25);
  textSize(18);
  textAlign(CENTER, CENTER);
  fill(white);
  text("LOAD", 945, 685);
  
}


void Save_Button() {
  
  fill(black);
  strokeWeight(2);
  stroke(black);
  if (mouseX >= 910 && mouseX <= 980 && mouseY >= 715 && mouseY <= 740) {
    stroke(white);
  }
  rect(910, 715, 70, 25);
  textSize(18);
  textAlign(CENTER, CENTER);
  fill(white);
  text("SAVE", 945, 725);
  
}

//Control Functions that cause things to happen when clicked
void stampControl() {
  
   if (mouseX >= 750 && mouseX <= 820 && mouseY >= 634.5 && mouseY <= 739.5) {
    
     StampOn = true;
     EraserOn = false;
   
   }
  
}


void eraserControl() {
  
   if (mouseX >= 845 && mouseX <= 885 && mouseY >= 662 && mouseY <= 702) {
    
     EraserOn = true;
     StampOn = false;
   
   }
  
}



// NEW SAVE LOAD Buttons
void new_buttonControl() {
  
  if (mouseX >= 910 && mouseX <= 980 && mouseY >= 635 && mouseY <= 660) {
    stroke(white);
    fill(white);
    rect(0, 0, 1000, 625);
  }
  
}


void load_buttonControl() {
  
  if (mouseX >= 910 && mouseX <= 980 && mouseY >= 675 && mouseY <= 700) {
    
    selectInput("Pick an image to load", "openImage");
    
  }
  
}

void save_buttonControl() {
  
  if (mouseX >= 910 && mouseX <= 980 && mouseY >= 715 && mouseY <= 740) {
    
    selectOutput("Choose a name for your new image file", "saveImage");
    
  }
  
}

void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(0, 0, 1000, 625);
    canvas.save(f.getAbsolutePath());
  }
  
}

void openImage(File f) {
  if (f != null) {
    //KLUDGE
    int n = 0;
    while (n < 69) {
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 0);
      n = n + 1;
    }
  }
  
}
