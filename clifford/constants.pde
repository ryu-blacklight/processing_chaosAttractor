void initializing()
{
  switch(_initialize){
    case 0:
      _const[1][0] = 1.174;
      _const[1][1] = -1.174;
      _const[1][2] = 1.174;
      _const[2][0] = 1.182;
      _const[2][1] = 1.182;
      _const[2][2] = 1.182;
      break;
      
    case 1:
      _const[1][0] = 1.350;
      _const[1][1] = -1.350;
      _const[1][2] = 1.350;
      _const[2][0] = 0.7;
      _const[2][1] = 0.7;
      _const[2][2] = 0.7;
      break;
  }
  
  _const[0][0] = 1f;
  _const[0][1] = 1f;
  _const[0][2] = 1f;
  
  d_var[1][0] = abs(_const[1][0]);
  d_var[1][1] = -abs(_const[1][1]);
  d_var[1][2] = abs(_const[1][2]);
  d_var[2][0] = -_const[2][0];
  d_var[2][1] = -_const[2][1];
  d_var[2][2] = -_const[2][2];
  x = _const[0][0];
  y = _const[0][1];
  z = _const[0][2];
  for(int i = 0; i < d_mov.length; i++){
    for(int j = 0; j < d_mov[i].length; j++){
      d_mov[i][j] = 0f;
    }
  }
}
