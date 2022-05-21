float WAVE_AMPLITUDE, WAVE_LENGTH, WAVE_CYCLE, WAVE_DEFAULT_PHASE, WAVE_TIME, WAVE_VELOCITY, WAVE_TIME_INCREMENT;

void behaviourSelector(byte type)
{
  float la = multiplying_positions[0][0] + increment[0][0];
  float lb = multiplying_positions[0][1] - increment[0][1];
  float lc = multiplying_positions[0][2] + increment[0][2];
  
  float ld = multiplying_positions[1][0] + increment[1][0];
  float le = multiplying_positions[1][1] + increment[1][1];
  float lf = multiplying_positions[1][2] + increment[1][2];
  
  switch(type){
    case 0:
      positions[0] = sin(la*y + la*h1) + ld*cos(la*z + la*h2);
      positions[1] = sin(lb*z + lb*h1) + le*cos(lb*x + lb*h2);
      positions[2] = sin(lc*x + lc*h1) + lf*cos(lc*y + lc*h2);
      break;
    
    case 1:
      positions[0] = sin(la*y) + ld*cos(la*z);
      positions[1] = sin(lb*z) + le*cos(lb*x);
      positions[2] = sin(lc*x) + lf*cos(lc*y);
      break;
      
    case 2:
      positions[0] = sin(la)*cos(la);
      positions[1] = sin(lb)*sin(la);
      positions[2] = sin(lc);
      break;
      
    case 3:
      positions[0] = sin(la*y)*cos(la*z) + ld*cos(la*z);
      positions[1] = sin(lb*z)*sin(lb*x) + le*cos(lb*x);
      positions[2] = cos(lc*x) + lf*cos(lc*y);
      break;
  }
}

void positionSetting_toArray()
{
  
  for(int i = 0; i < pointPositions_array[0].length; i++)
  {
    behaviourSelector(BEHAVIOUR_TYPE);
    x = positions[0];
    y = positions[1];
    z = positions[2];
    
    pointPositions_array[0][i] = x * width/6;
    pointPositions_array[1][i] = y * height/6;
    pointPositions_array[2][i] = z * width/6;
  }
}

void previousPosition_saving(){
  for(int i = 0; i < pointPositions_array[0].length; i++)
  {
    previous_pos[0][i] = pointPositions_array[0][i];
    previous_pos[1][i] = pointPositions_array[1][i];
    previous_pos[2][i] = pointPositions_array[2][i];
  }
}

float distance(float[] origin, float[] pos){
  float result = 0f;
  float[] powered_pos = calculationPow_difference(origin, pos);;
  
  if(pos.length == 2){       // 2D
    result = sqrt( powered_pos[0] + powered_pos[1] );
  }
  else if(pos.length == 3){  // 3D
    result = sqrt( powered_pos[0] + powered_pos[1] + powered_pos[2] );
  }
  else if(pos.length == 4){  // Assumes Quaternions are used.
    result = sqrt( powered_pos[0] + powered_pos[1] + powered_pos[2] + powered_pos[3] );
  }
  else{
    return 0;
  }
  return result;
}

float[] calculationPow_difference(float[] origin, float[] pos){
  float[] result = new float[pos.length];
  
  for(int i = 0; i < pos.length; i++){
    result[i] = pow(origin[i] - pos[i], 2);
  }
  return result;
}

float createWave(float amp, float cycle, float pos, float velo, float time, float _default){
  float wave, result;
  wave = amp * sin((_2PI / cycle) * (time + pos/velo) + _default);
  result = wave;
  
  return result;
}
