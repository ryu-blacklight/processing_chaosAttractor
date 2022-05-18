byte _saveType, _moving, _initialize, rendermode;
int[] _window = new int[2];
int _points, _pointsf, _execution;


void loadSettings(){
  
  // declares window-size.
  _window[0] = 800;
  _window[1] = 800;
  
  // determines point-placing.
  _points = 60000;
  _pointsf = 3000000;
  
  // saving format declares.
  // 0 = doesn't save. 1 = generates a single image.
  // 2 = multiple image data in frame### directory.
  _saveType = 0;
  
  // changes to run point-function.
  // 0 = light-mode. running amount is quater the default times.
  // 1 = default-mode. Sets up the PC considering its specifications.
  // 2 = Final rendering mode. refers the pointsf variant.
  rendermode = 1;
  
  // select moving formula.
  _moving = 2;
  
  // declares constant-selection. 
  _initialize = 1;
}

void calcExecution(){
  switch(rendermode){
    case 0:
      _execution = _points/4;
      break;
      
    case 1:
      _execution = _points;
      break;
      
    case 2:
      _execution = _pointsf;
      break;
  }
}
