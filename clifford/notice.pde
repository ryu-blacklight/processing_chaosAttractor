PGraphics _notice;
boolean n_frg = false;

void notice(byte type){
  String string_notice = "0";
  _notice.beginDraw();
  _notice.textSize(24);
  _notice.noStroke();
  _notice.fill(255,255,255,100);
  if(type == 0){
    string_notice = "The save is disabled for this run.";
  }else if(type == 1){
    string_notice = "The save format is currently .png, The numbers begin from " + (_saved+1) + ".";
  }else if(type == 2){
    string_notice = "Frames save into frame" + (_saved+1) + " directory.";
  }else{
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
