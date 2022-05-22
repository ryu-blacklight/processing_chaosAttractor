PGraphics _notice;
boolean n_frg = false;

float[] bezier_pos = new float[12];

byte SAVE_MODE, BEHAVIOUR_TYPE, DEFAULT_VALUE_SELECTION, RENDER_MODE, POINTS_COLORING_TYPE, DRAWING_RULE;
int[] WINDOW_SIZE = new int[2];
int POINTS_QUANTITY, POINTS_QUANTITY_FINAL, LINES_QUANTITY, EXECUTIONS_QUANTITY;


void notice(byte type){
  String string_notice = "0";
  _notice.beginDraw();
  _notice.textSize(24);
  _notice.noStroke();
  _notice.fill(255,255,255,100);
  
  if(type == 0){
    string_notice = "The save is disabled for this run.";
  }
  else if(type == 1){
    string_notice = "The save format is currently .png, The numbers begin from " + (saved++) + ".";
  }
  else if(type == 2){
    string_notice = "Frames save into frame" + (saved++) + " directory.";
  }
  else{
    string_notice = "This running will not save to images.";
  }
  
  _notice.text(string_notice, 0, 30);
  _notice.endDraw();
}

boolean noticeOff(boolean frag){
  _notice = null;
  frag = !frag;
  return frag;
}

void cameraBehaviour()
{
  translate(width/2,height/2);
  rotateX(radians(-mouseY/4));
  rotateY(radians(-mouseX/4));
}

void renderCalculation(){
  if(DRAWING_RULE == 0){
    switch(RENDER_MODE){
      case 0:
        EXECUTIONS_QUANTITY = POINTS_QUANTITY/4;
        break;
        
      case 1:
        EXECUTIONS_QUANTITY = POINTS_QUANTITY;
        break;
        
      case 2:
        EXECUTIONS_QUANTITY = POINTS_QUANTITY_FINAL;
        break;
    }
  }else if(DRAWING_RULE > 0){
    EXECUTIONS_QUANTITY = LINES_QUANTITY;
  }
}

void drawExecution(){
  noFill();
  if(DRAWING_RULE == 3){
    drawColor_selection(0);
    beginShape();
      for(int i = 0; i < pointPositions_array[0].length; i++){
        curveVertex(pointPositions_array[0][i], pointPositions_array[1][i], pointPositions_array[2][i]);
      }
      curveVertex(pointPositions_array[0][0], pointPositions_array[1][0], pointPositions_array[2][0]);
    endShape(CLOSE);
  }
  else{
    for(int i = 0; i < pointPositions_array[0].length; i++){
        drawColor_selection(i);
    }
  }
}

void drawColor_selection(int i){
  switch(POINTS_COLORING_TYPE){
    case 0:
      if(i < (pointPositions_array[0].length/3) *2){
        stroke(0, 200, 0, 30);
      }
      else if(i < (pointPositions_array[0].length/4)*3 && i >= (pointPositions_array[0].length/3) *2){
        stroke(200, 0, 0, 30);
      }
      else{
        stroke(0, 0, 200, 30);
      }
      break;
      
    case 1:
      float[] pos = {pointPositions_array[0][i], pointPositions_array[1][i], pointPositions_array[2][i]};
      float radius = distance(ORIGIN, pos);
      float time = (float)millis()/1000;
      
      float red_intensity = map(createWave(WAVE_AMPLITUDE, WAVE_CYCLE, radius, WAVE_VELOCITY, time, WAVE_DEFAULT_PHASE), -1, 1, 0, 1);
      float blue_intensity = map(createWave(WAVE_AMPLITUDE, WAVE_CYCLE/2, radius, WAVE_VELOCITY, time, WAVE_DEFAULT_PHASE), -1, 1, 0, 1);
      
      stroke(200 * red_intensity, 200, 200 * blue_intensity, 30);
      break;
  }
  if(DRAWING_RULE == 0){
    point(pointPositions_array[0][i], pointPositions_array[1][i], pointPositions_array[2][i]);
  }
  else if(DRAWING_RULE == 1){
    line(previous_pos[0][i], previous_pos[1][i], previous_pos[2][i], pointPositions_array[0][i], pointPositions_array[1][i], pointPositions_array[2][i]);
  }
  else if(DRAWING_RULE == 2 && i != pointPositions_array[0].length-1){
    line(pointPositions_array[0][i], pointPositions_array[1][i], pointPositions_array[2][i], pointPositions_array[0][i+1], pointPositions_array[1][i+1], pointPositions_array[2][i+1]);
  }else if(DRAWING_RULE == 4 && i != pointPositions_array[0].length-1){
    bezier_pos[0]  = pointPositions_array[0][i];
    bezier_pos[1]  = pointPositions_array[1][i];
    bezier_pos[2]  = pointPositions_array[2][i];
    bezier_pos[3]  = pointPositions_array[0][i]   + previous_pos[0][i];
    bezier_pos[4]  = pointPositions_array[1][i]   + previous_pos[0][i];
    bezier_pos[5]  = pointPositions_array[2][i]   + previous_pos[0][i];
    bezier_pos[6]  = pointPositions_array[0][i+1] + previous_pos[0][i+1];
    bezier_pos[7]  = pointPositions_array[1][i+1] + previous_pos[0][i+1];
    bezier_pos[8]  = pointPositions_array[2][i+1] + previous_pos[0][i+1];
    bezier_pos[9]  = pointPositions_array[0][i+1];
    bezier_pos[10] = pointPositions_array[1][i+1];
    bezier_pos[11] = pointPositions_array[2][i+1];
    
    bezier(bezier_pos[0], bezier_pos[1], bezier_pos[2], bezier_pos[3], bezier_pos[4], bezier_pos[5], bezier_pos[6], bezier_pos[7], bezier_pos[8], bezier_pos[9], bezier_pos[10], bezier_pos[11]);
  }
}
