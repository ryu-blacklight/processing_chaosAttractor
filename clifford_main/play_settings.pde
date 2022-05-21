void load_playSettings(){
  
  // declares window-size.
  WINDOW_SIZE[0] = 800;
  WINDOW_SIZE[1] = 800;
  
  // determines point-placing.
  POINTS_QUANTITY = 60000;
  POINTS_QUANTITY_FINAL = 3000000;
  
  LINES_QUANTITY = 5000;
  
  DRAWING_RULE = 0;
  
  // saving format declares.
  // 0 = doesn't save. 1 = generates a single image.
  // 2 = multiple image data in frame### directory.
  SAVE_MODE = 0;
  
  // changes to run point-function.
  // 0 = light-mode. running amount is quater the default times.
  // 1 = default-mode. Sets up the PC considering its specifications.
  // 2 = Final rendering mode. refers the pointsf variant.
  RENDER_MODE = 1;
  
  POINTS_COLORING_TYPE = 1;
  
  // select moving formula.
  BEHAVIOUR_TYPE = 0;
  
  // declares constant-selection. 
  DEFAULT_VALUE_SELECTION = 1;
}

void load_waveSettings(){
  WAVE_AMPLITUDE = 1;
  WAVE_CYCLE = 2;
  WAVE_VELOCITY = 1;
  WAVE_DEFAULT_PHASE = 0*PI;
  
  WAVE_TIME_INCREMENT = 0.001;
  
  
  //WAVE_LENGTH = null;
  //WAVE_TIME = null;
}
