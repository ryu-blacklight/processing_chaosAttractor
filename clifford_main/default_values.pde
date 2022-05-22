void defaultValue_settings()
{
  constants[0][0] = 1f;  // x
  constants[0][1] = 1f;  // y
  constants[0][2] = 1f;  // z
  
  switch(DEFAULT_VALUE_SELECTION){
    case 0:
      constants[1][0] = 1.174;
      constants[1][1] = -1.174;
      constants[1][2] = 1.174;
      constants[2][0] = 1.182;
      constants[2][1] = 1.182;
      constants[2][2] = 1.182;
      break;
      
    case 1:
      constants[1][0] = 1.350;
      constants[1][1] = -1.350;
      constants[1][2] = 1.350;
      constants[2][0] = 0.7;
      constants[2][1] = 0.7;
      constants[2][2] = 0.7;
      break;
  }
  
  multiplying_positions[0][0] = abs(constants[1][0]);
  multiplying_positions[0][1] = -abs(constants[1][1]);
  multiplying_positions[0][2] = abs(constants[1][2]);
  multiplying_positions[1][0] = -constants[2][0];
  multiplying_positions[1][1] = -constants[2][1];
  multiplying_positions[1][2] = -constants[2][2];
  
  x = constants[0][0];
  y = constants[0][1];
  z = constants[0][2];
  for(int i = 0; i < increment[1].length; i++){
    increment[0][i] = 0.001;
    increment[1][i] = 0.0001;
  }
}

void arrayInitializing(){
  for(int i = 0; i < previous_pos.length; i++){
    for(int j = 0; j < previous_pos[0].length; j++){
      previous_pos[i][j] = constants[0][i];
    }
  }
}
