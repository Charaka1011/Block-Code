#include "EngduinoLight.h" 
#include "EngduinoThermistor.h" 
#include "EngduinoButton.h" 
#include "EngduinoLEDs.h" 
#include "EngduinoAccelerometer.h" 
#include "Wire.h" 

void setup() {
	EngduinoLight.begin();
	EngduinoThermistor.begin();
	EngduinoButton.begin();
	EngduinoLEDs.begin();
	EngduinoAccelerometer.begin();
}

void loop() {
	if(EngduinoButton.wasPressed() == 1) {
		EngduinoLEDs.setLED(15, WHITE);
		delay(1000);
	}
	EngduinoLEDs.setLED(15, OFF);
	delay(1000);
}
