//2D Arrays constants, These have the following relationship.
//[0][] = xyz, position.
//[1][] = abc, general multiply at xyz.
//[2][] = def, cos() multiply at xyz.
float[][] constants = new float[3][3];

float[] positions = new float[3];
float[][] multiplying_positions = new float[2][3];

float[][] increment = new float[2][3];
float[] ORIGIN = {0, 0, 0};

float x, y, z;

static final float _2PI = 2*PI;
//float cursorParts;

float[][] pointPositions_array;
float[][] previous_pos;
float g, h1, h2;

void settings(){
  loadJSON();
  
  load_playSettings();
  load_waveSettings();
  defaultValue_settings();
  renderCalculation();
  
  pointPositions_array = new float[3][EXECUTIONS_QUANTITY];
  previous_pos = new float[3][EXECUTIONS_QUANTITY];
  arrayInitializing();
  
  size(WINDOW_SIZE[0], WINDOW_SIZE[1], P3D);
}

void setup()
{
  frameRate(60);
  perspective();
  
  background(0);
  colorMode(RGB, 255, 255, 255, 100);
  blendMode(ADD);
  ellipseMode(CENTER);
  _notice = createGraphics(WINDOW_SIZE[0], WINDOW_SIZE[1]);
  notice(SAVE_MODE);
}


void draw()
{
  h1 = sin(g);
  h2 = cos(g);
  background(0);
  
  pushMatrix();
  
  //cursorDraw();
  positionSetting_toArray(); 
  cameraBehaviour();
  
  drawExecution();
  
  popMatrix();
  saveJSON();
  
  if(_notice != null) image(_notice, 0, 0);
  if(millis() > 7000 && n_frg == false) n_frg = noticeOff(n_frg);
  if(g >= 360) g=1;
  g += 0.005;
  
  previousPosition_saving();
  println(frameCount);
}



//void cursorDraw() //WIP
//{
//  noFill();
//  for(int i = 0; i < cursorParts; i++){
//    arc(mouseX, mouseY, 10, 10, 0, 0);
//  }
//}
