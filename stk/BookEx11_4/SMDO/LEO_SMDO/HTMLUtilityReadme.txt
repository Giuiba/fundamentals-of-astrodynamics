Description

      This should be generic enough to use in any sensor scheduling task. Instructions: Use inside STK - Report is saved to the scenario folder called resourceInfo.txt and will overwrite without warning - Sensor is the object you want to add target times to - Sensor object in Scheduler is the parent object of the sensor - A constellation of target objects must be created... in your case, this is a constellation of all satellites in the resource group - Currently Scheduler doesn't return the target type, so you have to select the target type manually so I can issue the connect command Duty cylce is reported at the end of the script in a message box.

Author 
	Chris Kucera 

STK Version
	STK 8.0 


Instructions:

Use inside STK

- Report is saved to the scenario folder called resourceInfo.txt and will overwrite without warning

- Sensor is the object you want to add target times to

- Sensor object in Scheduler is the parent object of the sensor

- A constellation of target objects must be created... in your case, this is a constellation of all satellites in the resource group

- Currently Scheduler doesn't return the target type, so you have to select the target type manually so I can issue the connect command

 

Duty cylce is reported at the end of the script in a message box.
