import ddf.minim.*;
import processing.serial.*;

Serial myPort;
Minim minim;
AudioPlayer player;
String[] soundFiles = new String[2];
int currentNo;

void setup() {
  fullScreen();
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[5], 9600);
  soundFiles[0] = "sound1.mp3";
  soundFiles[1] = "sound2.mp3";
  minim = new Minim(this);
}

void draw() {
  while(myPort.available() > 0) {
    int inByte = myPort.read();
    println(inByte - '0');
    if (currentNo != inByte - '0') {
      currentNo = inByte - '0';
      player = minim.loadFile(soundFiles[currentNo - 1]);
      player.play();
      background(random(0, 255), random(0, 255),random(0, 255));
    }
    else {
      if (!player.isPlaying()) {
        player.rewind();
        player.play();
      }
    }
  }
  
}