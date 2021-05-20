EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Automatic-Presser-rescue:Arduino_Nano_R3-arduino_nano_r3 U1
U 1 1 603AB668
P 4000 3000
F 0 "U1" H 4000 3000 50  0000 C CNN
F 1 "Arduino_Nano_R3" H 4000 2900 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4000 1800 50  0001 C TNN
F 3 "http://vctec.co.kr/web/product/BAE/img/Arduinodocumentation.pdf" H 4000 1700 50  0001 C TNN
	1    4000 3000
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:Pololu_Breakout_A4988 A2
U 1 1 603AF324
P 9300 4100
F 0 "A2" V 9300 3900 50  0000 C CNN
F 1 "Pololu_Breakout_A4988" V 9400 4050 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 9575 3350 50  0001 L CNN
F 3 "https://www.pololu.com/product/2980/pictures" H 9400 3800 50  0001 C CNN
	1    9300 4100
	1    0    0    -1  
$EndComp
$Comp
L Motor:Stepper_Motor_bipolar M1
U 1 1 6037F04B
P 7100 5450
F 0 "M1" V 7068 5262 50  0000 R CNN
F 1 "Stepper_Motor_bipolar" V 6977 5262 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 7110 5440 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 7110 5440 50  0001 C CNN
	1    7100 5450
	0    -1   -1   0   
$EndComp
Text GLabel 6800 5350 0    50   Input ~ 0
S11A
Text GLabel 6800 5550 0    50   Input ~ 0
S11B
Text GLabel 7000 5750 3    50   Input ~ 0
S12A
Text GLabel 7200 5750 3    50   Input ~ 0
S12B
Text GLabel 7500 4300 2    50   Output ~ 0
S12B
Text GLabel 7500 4200 2    50   Output ~ 0
S12A
Text GLabel 7500 4000 2    50   Output ~ 0
S11B
Text GLabel 7500 4100 2    50   Output ~ 0
S11A
$Comp
L Device:CP1 C1
U 1 1 603B0AB0
P 7550 3550
F 0 "C1" H 7665 3596 50  0000 L CNN
F 1 "100uF" H 7650 3500 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 7550 3550 50  0001 C CNN
F 3 "~" H 7550 3550 50  0001 C CNN
	1    7550 3550
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:Pololu_Breakout_A4988 A1
U 1 1 603AE14A
P 7000 4100
F 0 "A1" V 7000 3900 50  0000 C CNN
F 1 "Pololu_Breakout_A4988" V 7100 4050 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 7275 3350 50  0001 L CNN
F 3 "https://www.pololu.com/product/2980/pictures" H 7100 3800 50  0001 C CNN
	1    7000 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 6038D6D1
P 9850 3550
F 0 "C2" H 9965 3596 50  0000 L CNN
F 1 "100uF" H 9950 3500 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 9850 3550 50  0001 C CNN
F 3 "~" H 9850 3550 50  0001 C CNN
	1    9850 3550
	1    0    0    -1  
$EndComp
Text GLabel 9800 4000 2    50   Output ~ 0
S21B
Text GLabel 9800 4100 2    50   Output ~ 0
S21A
Text GLabel 9800 4200 2    50   Output ~ 0
S22A
Text GLabel 9800 4300 2    50   Output ~ 0
S22B
$Comp
L Motor:Stepper_Motor_bipolar M2
U 1 1 60396815
P 9400 5450
F 0 "M2" V 9368 5262 50  0000 R CNN
F 1 "Stepper_Motor_bipolar" V 9277 5262 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 9410 5440 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 9410 5440 50  0001 C CNN
	1    9400 5450
	0    -1   -1   0   
$EndComp
Text GLabel 9100 5350 0    50   Input ~ 0
S21A
Text GLabel 9100 5550 0    50   Input ~ 0
S21B
Text GLabel 9300 5750 3    50   Input ~ 0
S22A
Text GLabel 9500 5750 3    50   Input ~ 0
S22B
$Comp
L Switch:SW_DIP_x03 SW1
U 1 1 6039BFA4
P 6100 4600
F 0 "SW1" H 6100 4425 50  0000 C CNN
F 1 "SW_DIP_x03" H 6100 4334 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx03_Slide_6.7x9.18mm_W7.62mm_P2.54mm_LowProfile" H 6100 4600 50  0001 C CNN
F 3 "~" H 6100 4600 50  0001 C CNN
	1    6100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4400 6400 4400
Wire Wire Line
	6600 4500 6400 4500
Wire Wire Line
	6600 4600 6400 4600
$Comp
L Switch:SW_DIP_x03 SW2
U 1 1 603A4CEA
P 8450 4600
F 0 "SW2" H 8450 4425 50  0000 C CNN
F 1 "SW_DIP_x03" H 8450 4334 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx03_Slide_6.7x9.18mm_W7.62mm_P2.54mm_LowProfile" H 8450 4600 50  0001 C CNN
F 3 "~" H 8450 4600 50  0001 C CNN
	1    8450 4600
	1    0    0    -1  
$EndComp
NoConn ~ 3050 2400
NoConn ~ 3050 2500
NoConn ~ 4200 2000
Text GLabel 4950 3150 2    50   Output ~ 0
A1_EN
Text GLabel 4950 3250 2    50   Output ~ 0
A1_STEP
Text GLabel 4950 3450 2    50   Output ~ 0
A1_DIR
Text GLabel 4950 3650 2    50   Output ~ 0
A2_EN
Text GLabel 4950 3350 2    50   Output ~ 0
A2_STEP
Text GLabel 4950 3550 2    50   Output ~ 0
A2_DIR
$Comp
L power:+12V #PWR0112
U 1 1 6043B795
P 7550 3400
F 0 "#PWR0112" H 7550 3250 50  0001 C CNN
F 1 "+12V" H 7565 3573 50  0000 C CNN
F 2 "" H 7550 3400 50  0001 C CNN
F 3 "" H 7550 3400 50  0001 C CNN
	1    7550 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0113
U 1 1 6043DA6C
P 9850 3400
F 0 "#PWR0113" H 9850 3250 50  0001 C CNN
F 1 "+12V" H 9865 3573 50  0000 C CNN
F 2 "" H 9850 3400 50  0001 C CNN
F 3 "" H 9850 3400 50  0001 C CNN
	1    9850 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0115
U 1 1 60441801
P 5350 1600
F 0 "#PWR0115" H 5350 1450 50  0001 C CNN
F 1 "+12V" H 5365 1773 50  0000 C CNN
F 2 "" H 5350 1600 50  0001 C CNN
F 3 "" H 5350 1600 50  0001 C CNN
	1    5350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1600 6150 1600
$Comp
L Device:CP1 C3
U 1 1 60445E9E
P 5350 1850
F 0 "C3" H 5100 1900 50  0000 L CNN
F 1 "0.33uF" H 4950 1800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 5350 1850 50  0001 C CNN
F 3 "~" H 5350 1850 50  0001 C CNN
	1    5350 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C4
U 1 1 6044694A
P 6150 1850
F 0 "C4" H 6250 1900 50  0000 L CNN
F 1 "0.1uF" H 6250 1800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 6150 1850 50  0001 C CNN
F 3 "~" H 6150 1850 50  0001 C CNN
	1    6150 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1600 5350 1700
Connection ~ 5350 1600
Wire Wire Line
	5350 1600 5450 1600
Wire Wire Line
	6150 1600 6150 1700
Wire Wire Line
	5350 2000 5750 2000
Wire Wire Line
	5750 2000 6150 2000
Connection ~ 5750 2000
Wire Wire Line
	5750 1900 5750 2000
$Comp
L Regulator_Linear:LM7809_TO220 U2
U 1 1 60454EA6
P 5750 1600
F 0 "U2" H 5750 1842 50  0000 C CNN
F 1 "LM7809_TO220" H 5750 1751 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 5750 1825 50  0001 C CIN
F 3 "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF" H 5750 1550 50  0001 C CNN
	1    5750 1600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 604912CB
P 4050 4550
F 0 "J1" H 3820 4592 50  0000 R CNN
F 1 "Barrel_Jack_Switch" H 3820 4501 50  0000 R CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 4100 4510 50  0001 C CNN
F 3 "~" H 4100 4510 50  0001 C CNN
	1    4050 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0119
U 1 1 60492176
P 4400 4350
F 0 "#PWR0119" H 4400 4200 50  0001 C CNN
F 1 "+12V" H 4415 4523 50  0000 C CNN
F 2 "" H 4400 4350 50  0001 C CNN
F 3 "" H 4400 4350 50  0001 C CNN
	1    4400 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 604A3FC5
P 8700 2250
F 0 "C5" H 8815 2296 50  0000 L CNN
F 1 "100nF" H 8815 2205 50  0000 L CNN
F 2 "" H 8738 2100 50  0001 C CNN
F 3 "~" H 8700 2250 50  0001 C CNN
	1    8700 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 604A4A02
P 8400 1850
F 0 "R1" H 8470 1896 50  0000 L CNN
F 1 "150kOhm" H 8470 1805 50  0000 L CNN
F 2 "" V 8330 1850 50  0001 C CNN
F 3 "~" H 8400 1850 50  0001 C CNN
	1    8400 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 604A562E
P 8700 2550
F 0 "R2" H 8770 2596 50  0000 L CNN
F 1 "1kOhm" H 8770 2505 50  0000 L CNN
F 2 "" V 8630 2550 50  0001 C CNN
F 3 "~" H 8700 2550 50  0001 C CNN
	1    8700 2550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual_x2 SW3
U 1 1 604A6D85
P 8400 2400
F 0 "SW3" V 8300 2750 50  0000 R CNN
F 1 "SW_Push_Dual_x2" V 8400 3200 50  0000 R CNN
F 2 "" H 8400 2600 50  0001 C CNN
F 3 "~" H 8400 2600 50  0001 C CNN
	1    8400 2400
	0    -1   1    0   
$EndComp
Wire Wire Line
	8400 2600 8400 2700
Wire Wire Line
	8400 2700 8700 2700
Wire Wire Line
	8700 2100 8400 2100
Connection ~ 8400 2100
Wire Wire Line
	8400 2100 8400 2200
Wire Wire Line
	8400 2000 8400 2100
Wire Wire Line
	5800 4500 5800 4400
Wire Wire Line
	5800 4600 5800 4500
Connection ~ 5800 4500
Wire Wire Line
	8150 4400 8150 4500
Connection ~ 8150 4500
Wire Wire Line
	8150 4600 8150 4500
Wire Wire Line
	8900 4600 8750 4600
Wire Wire Line
	8900 4500 8750 4500
Wire Wire Line
	8900 4400 8750 4400
Wire Wire Line
	4350 4550 4350 4650
Wire Wire Line
	4350 4450 4400 4450
Wire Wire Line
	4400 4450 4400 4350
Wire Wire Line
	6600 3700 6600 3800
Wire Wire Line
	8900 3700 8900 3800
Wire Wire Line
	7200 3400 7550 3400
Connection ~ 7550 3400
Wire Wire Line
	9500 3400 9850 3400
Connection ~ 9850 3400
Text GLabel 4950 2650 2    50   Input ~ 0
INT
Text GLabel 8300 2100 0    50   Output ~ 0
INT
Wire Wire Line
	8300 2100 8400 2100
$Comp
L Motor:Motor_Servo M3
U 1 1 604C89EA
P 6650 2450
F 0 "M3" H 6982 2515 50  0000 L CNN
F 1 "Motor_Servo" H 6982 2424 50  0000 L CNN
F 2 "" H 6650 2260 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 6650 2260 50  0001 C CNN
	1    6650 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 604CBD34
P 4350 4650
F 0 "#PWR0101" H 4350 4400 50  0001 C CNN
F 1 "GND" H 4355 4477 50  0000 C CNN
F 2 "" H 4350 4650 50  0001 C CNN
F 3 "" H 4350 4650 50  0001 C CNN
	1    4350 4650
	1    0    0    -1  
$EndComp
Connection ~ 4350 4650
Wire Wire Line
	3900 4000 4000 4000
$Comp
L power:GND #PWR0102
U 1 1 604CE5E7
P 4000 4000
F 0 "#PWR0102" H 4000 3750 50  0001 C CNN
F 1 "GND" H 4005 3827 50  0000 C CNN
F 2 "" H 4000 4000 50  0001 C CNN
F 3 "" H 4000 4000 50  0001 C CNN
	1    4000 4000
	1    0    0    -1  
$EndComp
Connection ~ 4000 4000
Wire Wire Line
	4000 4000 4100 4000
$Comp
L power:GND #PWR0103
U 1 1 604CEAE3
P 7000 4900
F 0 "#PWR0103" H 7000 4650 50  0001 C CNN
F 1 "GND" H 7005 4727 50  0000 C CNN
F 2 "" H 7000 4900 50  0001 C CNN
F 3 "" H 7000 4900 50  0001 C CNN
	1    7000 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 604CF35B
P 7200 4900
F 0 "#PWR0104" H 7200 4650 50  0001 C CNN
F 1 "GND" H 7205 4727 50  0000 C CNN
F 2 "" H 7200 4900 50  0001 C CNN
F 3 "" H 7200 4900 50  0001 C CNN
	1    7200 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 604CF5EB
P 6350 2550
F 0 "#PWR0105" H 6350 2300 50  0001 C CNN
F 1 "GND" H 6355 2377 50  0000 C CNN
F 2 "" H 6350 2550 50  0001 C CNN
F 3 "" H 6350 2550 50  0001 C CNN
	1    6350 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 604D08A3
P 9500 4900
F 0 "#PWR0106" H 9500 4650 50  0001 C CNN
F 1 "GND" H 9505 4727 50  0000 C CNN
F 2 "" H 9500 4900 50  0001 C CNN
F 3 "" H 9500 4900 50  0001 C CNN
	1    9500 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 604D0C3E
P 9850 3700
F 0 "#PWR0107" H 9850 3450 50  0001 C CNN
F 1 "GND" H 9855 3527 50  0000 C CNN
F 2 "" H 9850 3700 50  0001 C CNN
F 3 "" H 9850 3700 50  0001 C CNN
	1    9850 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 604D299B
P 5750 2000
F 0 "#PWR0108" H 5750 1750 50  0001 C CNN
F 1 "GND" H 5755 1827 50  0000 C CNN
F 2 "" H 5750 2000 50  0001 C CNN
F 3 "" H 5750 2000 50  0001 C CNN
	1    5750 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 604D2E5C
P 8400 2700
F 0 "#PWR0109" H 8400 2450 50  0001 C CNN
F 1 "GND" H 8405 2527 50  0000 C CNN
F 2 "" H 8400 2700 50  0001 C CNN
F 3 "" H 8400 2700 50  0001 C CNN
	1    8400 2700
	1    0    0    -1  
$EndComp
Connection ~ 8400 2700
$Comp
L power:GND #PWR0110
U 1 1 604D314E
P 9300 4900
F 0 "#PWR0110" H 9300 4650 50  0001 C CNN
F 1 "GND" H 9305 4727 50  0000 C CNN
F 2 "" H 9300 4900 50  0001 C CNN
F 3 "" H 9300 4900 50  0001 C CNN
	1    9300 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 604D4964
P 7550 3700
F 0 "#PWR0111" H 7550 3450 50  0001 C CNN
F 1 "GND" H 7555 3527 50  0000 C CNN
F 2 "" H 7550 3700 50  0001 C CNN
F 3 "" H 7550 3700 50  0001 C CNN
	1    7550 3700
	1    0    0    -1  
$EndComp
Text GLabel 3050 3100 0    50   Output ~ 0
SERV
Text GLabel 6350 2350 0    50   Input ~ 0
SERV
Wire Wire Line
	5950 2450 6350 2450
$Comp
L Regulator_Linear:LM7805_TO220 U3
U 1 1 604DC99C
P 7300 1600
F 0 "U3" H 7300 1842 50  0000 C CNN
F 1 "LM7805_TO220" H 7300 1751 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7300 1825 50  0001 C CIN
F 3 "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF" H 7300 1550 50  0001 C CNN
	1    7300 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0114
U 1 1 604DE0EE
P 4000 2000
F 0 "#PWR0114" H 4000 1850 50  0001 C CNN
F 1 "+9V" H 4015 2173 50  0000 C CNN
F 2 "" H 4000 2000 50  0001 C CNN
F 3 "" H 4000 2000 50  0001 C CNN
	1    4000 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0116
U 1 1 604DE5F3
P 6150 1600
F 0 "#PWR0116" H 6150 1450 50  0001 C CNN
F 1 "+9V" H 6165 1773 50  0000 C CNN
F 2 "" H 6150 1600 50  0001 C CNN
F 3 "" H 6150 1600 50  0001 C CNN
	1    6150 1600
	1    0    0    -1  
$EndComp
Connection ~ 6150 1600
$Comp
L power:+9V #PWR0117
U 1 1 604DEDD3
P 6900 1600
F 0 "#PWR0117" H 6900 1450 50  0001 C CNN
F 1 "+9V" H 6915 1773 50  0000 C CNN
F 2 "" H 6900 1600 50  0001 C CNN
F 3 "" H 6900 1600 50  0001 C CNN
	1    6900 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 604DFCE0
P 7300 1900
F 0 "#PWR0118" H 7300 1650 50  0001 C CNN
F 1 "GND" H 7305 1727 50  0000 C CNN
F 2 "" H 7300 1900 50  0001 C CNN
F 3 "" H 7300 1900 50  0001 C CNN
	1    7300 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C6
U 1 1 604E0262
P 6900 1750
F 0 "C6" H 6650 1800 50  0000 L CNN
F 1 "0.33uF" H 6500 1700 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 6900 1750 50  0001 C CNN
F 3 "~" H 6900 1750 50  0001 C CNN
	1    6900 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C7
U 1 1 604E0C06
P 7700 1750
F 0 "C7" H 7800 1800 50  0000 L CNN
F 1 "0.1uF" H 7800 1700 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7700 1750 50  0001 C CNN
F 3 "~" H 7700 1750 50  0001 C CNN
	1    7700 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1600 6900 1600
Connection ~ 6900 1600
Wire Wire Line
	7600 1600 7700 1600
Wire Wire Line
	6900 1900 7300 1900
Wire Wire Line
	7300 1900 7700 1900
Connection ~ 7300 1900
$Comp
L power:+5VL #PWR0120
U 1 1 604EA750
P 3800 2000
F 0 "#PWR0120" H 3800 1850 50  0001 C CNN
F 1 "+5VL" H 3815 2173 50  0000 C CNN
F 2 "" H 3800 2000 50  0001 C CNN
F 3 "" H 3800 2000 50  0001 C CNN
	1    3800 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR0121
U 1 1 604EB41E
P 7000 3400
F 0 "#PWR0121" H 7000 3250 50  0001 C CNN
F 1 "+5VL" H 7015 3573 50  0000 C CNN
F 2 "" H 7000 3400 50  0001 C CNN
F 3 "" H 7000 3400 50  0001 C CNN
	1    7000 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR0122
U 1 1 604EBC91
P 9300 3400
F 0 "#PWR0122" H 9300 3250 50  0001 C CNN
F 1 "+5VL" H 9315 3573 50  0000 C CNN
F 2 "" H 9300 3400 50  0001 C CNN
F 3 "" H 9300 3400 50  0001 C CNN
	1    9300 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR0123
U 1 1 604EC2A3
P 5800 4400
F 0 "#PWR0123" H 5800 4250 50  0001 C CNN
F 1 "+5VL" H 5815 4573 50  0000 C CNN
F 2 "" H 5800 4400 50  0001 C CNN
F 3 "" H 5800 4400 50  0001 C CNN
	1    5800 4400
	1    0    0    -1  
$EndComp
Connection ~ 5800 4400
$Comp
L power:+5VL #PWR0124
U 1 1 604EC828
P 8150 4400
F 0 "#PWR0124" H 8150 4250 50  0001 C CNN
F 1 "+5VL" H 8165 4573 50  0000 C CNN
F 2 "" H 8150 4400 50  0001 C CNN
F 3 "" H 8150 4400 50  0001 C CNN
	1    8150 4400
	1    0    0    -1  
$EndComp
Connection ~ 8150 4400
$Comp
L power:+5VL #PWR0125
U 1 1 604ECDCF
P 8400 1700
F 0 "#PWR0125" H 8400 1550 50  0001 C CNN
F 1 "+5VL" H 8415 1873 50  0000 C CNN
F 2 "" H 8400 1700 50  0001 C CNN
F 3 "" H 8400 1700 50  0001 C CNN
	1    8400 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0126
U 1 1 604EE973
P 7700 1600
F 0 "#PWR0126" H 7700 1450 50  0001 C CNN
F 1 "+5VP" H 7715 1773 50  0000 C CNN
F 2 "" H 7700 1600 50  0001 C CNN
F 3 "" H 7700 1600 50  0001 C CNN
	1    7700 1600
	1    0    0    -1  
$EndComp
Connection ~ 7700 1600
$Comp
L power:+5VP #PWR0127
U 1 1 604EF97C
P 5950 2450
F 0 "#PWR0127" H 5950 2300 50  0001 C CNN
F 1 "+5VP" H 5965 2623 50  0000 C CNN
F 2 "" H 5950 2450 50  0001 C CNN
F 3 "" H 5950 2450 50  0001 C CNN
	1    5950 2450
	1    0    0    -1  
$EndComp
Text GLabel 6600 4000 0    50   Input ~ 0
A1_EN
Text GLabel 6600 4100 0    50   Input ~ 0
A1_STEP
Text GLabel 6600 4200 0    50   Input ~ 0
A1_DIR
Text GLabel 8900 4200 0    50   Input ~ 0
A2_DIR
Text GLabel 8900 4100 0    50   Input ~ 0
A2_STEP
Text GLabel 8900 4000 0    50   Input ~ 0
A2_EN
$EndSCHEMATC
