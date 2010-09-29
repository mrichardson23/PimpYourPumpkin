#define CANDLELED 6
#define REDLED 7
#define BUZZER 5

int isClose = 0;

void setup() {
  
  
}

void loop() {
  if (isClose)
  {
    digitalWrite(CANDLELED, LOW);
    delay(3000);
    digitalWrite(REDLED, HIGH);
    tone(BUZZER, 38);
  }
  
  else
  {
    noTone(BUZZER);
    analogWrite(
    
  }
}
