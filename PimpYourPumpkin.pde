#define CANDLELED 11
#define REDLED 7
#define BUZZER 5
#define SENSOR 4
#define PROXIMITY_THRESHOLD 56
#define BUZZER_FREQUENCY 38
#define FLICKER_INTERVAL 20

long previousMillis = 0;

void setup() {
	pinMode(CANDLELED, OUTPUT);
	pinMode(REDLED, OUTPUT);
	pinMode(BUZZER, OUTPUT);
	pinMode(SENSOR, INPUT);
	delay(1000); // Allow the proximity sensor to initialize
}
void loop() {
	if (analogRead(0) > PROXIMITY_THRESHOLD) // Is someone close?
	{ // Then activate EVIL pumpkin:
		digitalWrite(CANDLELED, LOW);
		digitalWrite(REDLED, HIGH);
		tone(BUZZER, BUZZER_FREQUENCY);
	}
	else
	{ //regular candle flicker. Based on Arduino example BlinkWithoutDelay.
		noTone(BUZZER);
		digitalWrite(REDLED, LOW);
		unsigned long currentMillis = millis();
		if(currentMillis - previousMillis > FLICKER_INTERVAL)
		{
			previousMillis = currentMillis;
			analogWrite(CANDLELED, random(0, 256));
		}
	}
}
