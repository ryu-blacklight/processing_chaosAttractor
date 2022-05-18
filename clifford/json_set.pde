JSONObject json;
int _saved;
boolean _frag = false;

void loadJSON(){
  json = loadJSONObject("data/savedata.json");
  _saved = json.getInt("saved");
  loadSettings();
}

void saveformat(){
  if(_saveType == 0){
    println("The save is disabled for this run.");
  }else if(_saveType == 1){
    println("The save format is currently .png, The numbers begin from " + (_saved+1) + ".");
  }
  else if(_saveType == 2){
    println("Frames save into frame" + (_saved+1) + " directory.");
  }
  else{
    println("Saving-type setting has a illegal value. please check to the config.json in data/.");
    println("This running will not save to images.");
  }
}

void saveJSON(){
  if(_saveType == 1){
    _saved++;
    save("image" + _saved + ".png");
    json.setInt("saved", _saved);
    saveJSONObject(json, "data/config.json");
  }
  else if(_saveType == 2){
    if(!_frag){
      _saved++;
      saveFrame("frame" + _saved + "/image#####.png");
      json.setInt("saved", _saved);
      saveJSONObject(json, "data/savedata.json");
      _frag = !_frag;
    }
    else{
      saveFrame("frame" + _saved + "/image#####.png");
    }
  }
}
