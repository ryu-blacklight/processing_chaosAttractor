//2D Arrays _const, d_var, d_mov, These have the following relationship.
//[0][] = xyz, position.
//[1][] = abc, general multiply at xyz.
//[2][] = def, cos() multiply at xyz.

float[][] _const = new float[3][3];
float[][] d_var = new float[3][3];
float[][] d_mov = new float[3][3];

float x, y, z;
float twoPI = 2*PI;
float cursorParts;

float[][] pointAry;
float g, h1, h2;

void settings(){
  loadJSON();
  initializing();
  calcExecution();
  pointAry = new float[3][_execution];
  size(_window[0], _window[1], P3D);
}

void setup()
{
  frameRate(60);
  perspective();
  saveformat();
  
  background(0);
  colorMode(RGB, 255, 255, 255, 100);
  blendMode(ADD);
  ellipseMode(CENTER);
  _notice = createGraphics(_window[0], _window[1]);
  notice(_saveType);
}


void draw()
{
  h1 = sin(g);
  h2 = cos(g);
  background(0);
  
  pushMatrix();
  
  //cursorDraw();
  calculatePos(); 
  cameraBehaviour();
  
  for(int i = 0; i < pointAry[0].length; i++)
  {
    if(i < (pointAry[0].length/3) *2){
      stroke(0, 200, 0, 30);
    }else if(i < (pointAry[0].length/4)*3 && i >= (pointAry[0].length/3) *2){
      stroke(200, 0, 0, 30);
    }else{
      stroke(0, 0, 200, 30);
    }
    point(pointAry[0][i], pointAry[1][i], pointAry[2][i]);
  }
  
  popMatrix();
  saveJSON();
  
  if(_notice != null) image(_notice, 0, 0);
  if(millis() > 7000 && n_frg == false) n_frg = noticeOff(n_frg);
  if(g >= 360) g=1;
  g += 0.005;
}

void calculatePos()
{
  for(int i = 0; i < d_mov[1].length; i++){
    d_mov[1][i] += 0.001;
    d_mov[2][i] += 0.0001;
  }
  
  for(int i = 0; i < pointAry[0].length; i++)
  {
    selectMove(_moving);
    x = d_var[0][0];
    y = d_var[0][1];
    z = d_var[0][2];
    
    pointAry[0][i] = x*width/6;
    pointAry[1][i] = y*height/6;
    pointAry[2][i] = z*width/6;
  }
}

void cameraBehaviour()
{
  translate(width/2,height/2);
  rotateX(radians(-mouseY/4));
  rotateY(radians(-mouseX/4));
}

void cursorDraw() //WIP
{
  noFill();
  for(int i = 0; i < cursorParts; i++){
    arc(mouseX, mouseY, 10, 10, 0, 0);
  }
}

void selectMove(byte type)
{
  float la = d_var[1][0] + d_mov[1][0];
  float lb = d_var[1][1] - d_mov[1][1];
  float lc = d_var[1][2] + d_mov[1][2];
  
  float ld = d_var[2][0] + d_mov[2][0];
  float le = d_var[2][1] + d_mov[2][1];
  float lf = d_var[2][2] + d_mov[2][2];
  
  switch(type){
    case 0:
      d_var[0][0] = sin(la*y + la*h1) + ld*cos(la*z + la*h2);
      d_var[0][1] = sin(lb*z + lb*h1) + le*cos(lb*x + lb*h2);
      d_var[0][2] = sin(lc*x + lc*h1) + lf*cos(lc*y + lc*h2);
      break;
    
    case 1:
      d_var[0][0] = sin(la*y) + ld*cos(la*z);
      d_var[0][1] = sin(lb*z) + le*cos(lb*x);
      d_var[0][2] = sin(lc*x) + lf*cos(lc*y);
      break;
      
    case 2:
      d_var[0][0] = sin(la)*cos(la);
      d_var[0][1] = sin(lb)*sin(la);
      d_var[0][2] = sin(lc);
      break;
      
    case 3:
      d_var[0][0] = sin(la*y)*cos(la*z) + ld*cos(la*z);
      d_var[0][1] = sin(lb*z)*sin(lb*x) + le*cos(lb*x);
      d_var[0][2] = cos(lc*x) + lf*cos(lc*y);
      break;
  }
}
