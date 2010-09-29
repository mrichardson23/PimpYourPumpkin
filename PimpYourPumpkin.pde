#define CANDLELED 11
#define REDLED 7
#define BUZZER 5
#define SENSOR 4

int isClose = 0;
long previousMillis = 0;

void setup() {
	pinMode(CANDLELED, OUTPUT);
	pinMode(REDLED, OUTPUT);
	pinMode(BUZZER, OUTPUT);
	pinMode(SENSOR, INPUT);
}

void loop() {
	if ( digitalRead(SENSOR) == HIGH )
	{	
		isClose = 1;
	}
	else
	{
		isClose = 0;
	}
	
	if (isClose)
	{ //activate EVIL pumpkin:
		digitalWrite(CANDLELED, LOW);
		digitalWrite(REDLED, HIGH);
		tone(BUZZER, 38);
	}
  
	else
	{ //regular candle flicker. Based on Arduino example BlinkWithoutDelay.
		noTone(BUZZER);
		digitalWrite(REDLED, LOW);
		unsigned long currentMillis = millis();
		if(currentMillis - previousMillis > 20)
		{
			previousMillis = currentMillis;
			analogWrite(CANDLELED, random(0, 256));
		}
	}
}
