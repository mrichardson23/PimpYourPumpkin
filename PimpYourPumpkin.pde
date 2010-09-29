#define CANDLELED 6
#define REDLED 7
#define BUZZER 5

int isClose = 0;
long previousMillis = 0;

void setup() {
	pinMode(CANDLELED, OUTPUT);
	pinMode(REDLED, OUTPUT);
	pinMode(BUZZER, OUTPUT);
}

void loop() {
	//evaluate if subject is close here.

	if (isClose)
	{ //activate EVIL pumpkin:
		digitalWrite(CANDLELED, LOW);
		digitalWrite(REDLED, HIGH);
		tone(BUZZER, 38);
	}
  
	else
	{ //regular candle flicker:
		noTone(BUZZER);
		unsigned long currentMillis = millis();
		if(currentMillis - previousMillis > 200)
		{
			previousMillis = currentMillis;
			analogWrite(CANDLELED, random(0, 256));
		}
	}
}
