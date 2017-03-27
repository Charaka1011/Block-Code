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
	if(EngduinoThermistor.temperature() >10) {
		EngduinoLEDs.setLED(2, OFF);
		EngduinoLEDs.setLED(2, OFF);
		EngduinoLEDs.setLED(4, WHITE);
	}
	EngduinoLEDs.setLED(4, OFF);
	EngduinoLEDs.setLED(2, WHITE);
}
