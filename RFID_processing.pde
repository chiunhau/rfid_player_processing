import processing.sound.*;
import processing.serial.*;

Serial myPort;
SoundFile sound1;
void setup() {
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[5], 9600);
  sound1 = new SoundFile(this, "sound1.mp3");
}

void draw() {
  while(myPort.available() > 0) {
    int inByte = myPort.read();
    println(inByte - '0');
  }
}