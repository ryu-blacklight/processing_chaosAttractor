JSONObject json;

int[] _window = new int[2];
int _saved, _points;
boolean _frag = false;
byte savetypeByte = 0;
byte _saveType, _moving, _initialize;

void loadJSON(){
  json = loadJSONObject("_config.json");
  
  _window[0] = json.getInt("window-Width");
  _window[1] = json.getInt("window-Height");
  _points = json.getInt("point-setting");
  _saveType = byte(json.getInt("save-Type"));
  _moving = byte(json.getInt("moving"));
  _initialize = byte(json.getInt("constants-selection"));
  _saved = json.getInt("saved");
  
  size(_window[0], _window[1], P3D);
}

void saveformat(){
  if(_saveType == 0){
    savetypeByte = 0;
    println("The save is disabled for this run.");
  }else if(_saveType == 1){
    savetypeByte = 1;
    println("The save format is currently .png, The numbers begin from " + (_saved+1) + ".");
  }
  else if(_saveType == 2){
    savetypeByte = 2;
    println("Frames save into frame" + (_saved+1) + " directory.");
  }
  else{
    println("Saving-type setting has a illegal value. please check to the config.json in data/.");
    println("This running will not save to images.");
  }
}

void saveJSON(){
  if(savetypeByte == 1){
    _saved++;
    save("image" + _saved + ".png");
    json.setInt("saved", _saved);
    saveJSONObject(json, "data/config.json");
  }
  else if(savetypeByte == 2){
    if(!_frag){
      _saved++;
      saveFrame("frame" + _saved + "/image#####.png");
      json.setInt("saved", _saved);
      saveJSONObject(json, "_config.json");
      _frag = !_frag;
    }
    else{
      saveFrame("frame" + _saved + "/image#####.png");
    }
  }
}
