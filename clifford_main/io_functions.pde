JSONObject json;
int saved;
boolean notification_state = false;

void loadJSON(){
  json = loadJSONObject("data/savedata.json");
  saved = json.getInt("saved");
}

void saveJSON(){
  if(SAVE_MODE == 1){
    saved++;
    save("image" + saved + ".png");
    json.setInt("saved", saved);
    saveJSONObject(json, "data/config.json");
  }
  else if(SAVE_MODE == 2){
    if(!notification_state){
      saved++;
      saveFrame("frame" + saved + "/image#####.png");
      json.setInt("saved", saved);
      saveJSONObject(json, "data/savedata.json");
      notification_state = !notification_state;
    }
    else{
      saveFrame("frame" + saved + "/image#####.png");
    }
  }
}
