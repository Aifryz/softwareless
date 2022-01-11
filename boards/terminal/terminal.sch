EESchema Schematic File Version 4
LIBS:terminal-cache
EELAYER 29 0
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
L Switch:SW_Push_45deg SW1
U 1 1 61DC825C
P 900 1850
F 0 "SW1" H 900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 900 1850 50  0001 C CNN
F 3 "~" H 900 1850 50  0001 C CNN
	1    900  1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:74HC237 U1
U 1 1 61DC95EE
P 11700 1150
F 0 "U1" H 11700 1666 50  0000 C CNN
F 1 "74HC237" H 11700 1575 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 11700 1150 50  0001 C CNN
F 3 "" H 11700 1150 50  0001 C CNN
	1    11700 1150
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:74HC237 U2
U 1 1 61DC9F4E
P 11700 2350
F 0 "U2" H 11700 2866 50  0000 C CNN
F 1 "74HC237" H 11700 2775 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 11700 2350 50  0001 C CNN
F 3 "" H 11700 2350 50  0001 C CNN
	1    11700 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x14 J1
U 1 1 61DCB067
P 13300 1600
F 0 "J1" H 13300 2450 50  0000 L CNN
F 1 "Conn_01x14" H 13050 2350 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x14_P2.54mm_Vertical" H 13300 1600 50  0001 C CNN
F 3 "~" H 13300 1600 50  0001 C CNN
	1    13300 1600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x14 J2
U 1 1 61DCB9CE
P 13750 1700
F 0 "J2" H 13668 775 50  0000 C CNN
F 1 "Conn_01x14" H 13668 866 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x14_P2.54mm_Vertical" H 13750 1700 50  0001 C CNN
F 3 "~" H 13750 1700 50  0001 C CNN
	1    13750 1700
	-1   0    0    1   
$EndComp
$Comp
L Device:D D1
U 1 1 61DCEC35
P 800 1100
F 0 "D1" V 846 1021 50  0000 R CNN
F 1 "D" V 755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 800 1100 50  0001 C CNN
F 3 "~" H 800 1100 50  0001 C CNN
	1    800  1100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	13100 1000 13000 1000
Wire Wire Line
	13100 1100 13000 1100
Wire Wire Line
	13100 1200 13000 1200
Wire Wire Line
	13000 1300 13100 1300
Wire Wire Line
	13000 1400 13100 1400
Wire Wire Line
	13100 1500 13000 1500
Wire Wire Line
	13000 1600 13100 1600
Wire Wire Line
	13100 1700 13000 1700
Wire Wire Line
	13100 1800 13000 1800
Wire Wire Line
	13000 1900 13100 1900
Wire Wire Line
	13100 2000 13000 2000
Wire Wire Line
	13000 2100 13100 2100
Wire Wire Line
	13100 2200 13000 2200
Wire Wire Line
	13100 2300 13000 2300
Wire Wire Line
	13950 2300 14050 2300
Wire Wire Line
	13950 2200 14050 2200
Wire Wire Line
	13950 2100 14050 2100
Wire Wire Line
	13950 2000 14050 2000
Wire Wire Line
	13950 1900 14050 1900
Wire Wire Line
	13950 1800 14050 1800
Wire Wire Line
	13950 1700 14050 1700
Wire Wire Line
	13950 1600 14050 1600
Wire Wire Line
	13950 1500 14050 1500
Wire Wire Line
	13950 1400 14050 1400
Text Label 13000 1000 2    50   ~ 0
AREF
Text Label 13000 1100 2    50   ~ 0
A0
Text Label 13000 1200 2    50   ~ 0
A1
Text Label 13000 1300 2    50   ~ 0
A2
Text Label 13000 1400 2    50   ~ 0
A3
Text Label 13000 1500 2    50   ~ 0
A4
Text Label 13000 1600 2    50   ~ 0
A5
Text Label 13000 1700 2    50   ~ 0
A6
Text Label 13000 1800 2    50   ~ 0
D0
Text Label 13000 1900 2    50   ~ 0
D1
Text Label 13000 2000 2    50   ~ 0
D2
Text Label 13000 2100 2    50   ~ 0
D3
Text Label 13000 2200 2    50   ~ 0
D4
Text Label 13000 2300 2    50   ~ 0
D5
Text Label 14050 2300 0    50   ~ 0
D6
Text Label 14050 2200 0    50   ~ 0
D7
Text Label 14050 2100 0    50   ~ 0
D8
Text Label 14050 2000 0    50   ~ 0
D9
Text Label 14050 1900 0    50   ~ 0
D10
Text Label 14050 1800 0    50   ~ 0
D11
Text Label 14050 1700 0    50   ~ 0
D12
Text Label 14050 1600 0    50   ~ 0
D13
Text Label 14050 1500 0    50   ~ 0
D14
Text Label 14050 1400 0    50   ~ 0
RESET
Wire Wire Line
	14400 1300 14400 1350
Wire Wire Line
	13950 1300 14400 1300
$Comp
L power:GND #PWR0101
U 1 1 61DDB1A6
P 14400 1350
F 0 "#PWR0101" H 14400 1100 50  0001 C CNN
F 1 "GND" H 14405 1177 50  0000 C CNN
F 2 "" H 14400 1350 50  0001 C CNN
F 3 "" H 14400 1350 50  0001 C CNN
	1    14400 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	14400 1200 14400 1150
Wire Wire Line
	13950 1200 14400 1200
$Comp
L power:+3V3 #PWR0102
U 1 1 61DDC600
P 14400 1150
F 0 "#PWR0102" H 14400 1000 50  0001 C CNN
F 1 "+3V3" H 14415 1323 50  0000 C CNN
F 2 "" H 14400 1150 50  0001 C CNN
F 3 "" H 14400 1150 50  0001 C CNN
	1    14400 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	14250 1100 14250 1050
Wire Wire Line
	13950 1100 14250 1100
$Comp
L power:VBUS #PWR0103
U 1 1 61DDE7D1
P 14250 1050
F 0 "#PWR0103" H 14250 900 50  0001 C CNN
F 1 "VBUS" H 14265 1223 50  0000 C CNN
F 2 "" H 14250 1050 50  0001 C CNN
F 3 "" H 14250 1050 50  0001 C CNN
	1    14250 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 61DDF1B3
P 14100 950
F 0 "#PWR0104" H 14100 800 50  0001 C CNN
F 1 "+5V" H 14115 1123 50  0000 C CNN
F 2 "" H 14100 950 50  0001 C CNN
F 3 "" H 14100 950 50  0001 C CNN
	1    14100 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	14100 1000 14100 950 
Wire Wire Line
	13950 1000 14100 1000
$Comp
L Switch:SW_Push_45deg SW7
U 1 1 61DED366
P 1400 1850
F 0 "SW7" H 1400 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 1400 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1400 1850 50  0001 C CNN
F 3 "~" H 1400 1850 50  0001 C CNN
	1    1400 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW13
U 1 1 61DED8A1
P 1900 1850
F 0 "SW13" H 1900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 1900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1900 1850 50  0001 C CNN
F 3 "~" H 1900 1850 50  0001 C CNN
	1    1900 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW19
U 1 1 61DEDC7B
P 2400 1850
F 0 "SW19" H 2400 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 2400 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2400 1850 50  0001 C CNN
F 3 "~" H 2400 1850 50  0001 C CNN
	1    2400 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW25
U 1 1 61DEDF89
P 2900 1850
F 0 "SW25" H 2900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 2900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2900 1850 50  0001 C CNN
F 3 "~" H 2900 1850 50  0001 C CNN
	1    2900 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW31
U 1 1 61DEFC9F
P 3400 1850
F 0 "SW31" H 3400 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 3400 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3400 1850 50  0001 C CNN
F 3 "~" H 3400 1850 50  0001 C CNN
	1    3400 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW37
U 1 1 61DF0407
P 3900 1850
F 0 "SW37" H 3900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 3900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3900 1850 50  0001 C CNN
F 3 "~" H 3900 1850 50  0001 C CNN
	1    3900 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW43
U 1 1 61DF0737
P 4400 1850
F 0 "SW43" H 4400 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 4400 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4400 1850 50  0001 C CNN
F 3 "~" H 4400 1850 50  0001 C CNN
	1    4400 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW48
U 1 1 61DF0C47
P 4900 1850
F 0 "SW48" H 4900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 4900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4900 1850 50  0001 C CNN
F 3 "~" H 4900 1850 50  0001 C CNN
	1    4900 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW53
U 1 1 61DF1022
P 5400 1850
F 0 "SW53" H 5400 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 5400 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5400 1850 50  0001 C CNN
F 3 "~" H 5400 1850 50  0001 C CNN
	1    5400 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW58
U 1 1 61DF1804
P 5900 1850
F 0 "SW58" H 5900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 5900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5900 1850 50  0001 C CNN
F 3 "~" H 5900 1850 50  0001 C CNN
	1    5900 1850
	1    0    0    -1  
$EndComp
Text Notes 800  1550 0    50   ~ 0
ESC
Text Notes 1300 1550 0    50   ~ 0
F1
$Comp
L Switch:SW_Push_45deg SW63
U 1 1 61DF254F
P 6400 1850
F 0 "SW63" H 6400 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 6400 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6400 1850 50  0001 C CNN
F 3 "~" H 6400 1850 50  0001 C CNN
	1    6400 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW68
U 1 1 61DF2C17
P 6900 1850
F 0 "SW68" H 6900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 6900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6900 1850 50  0001 C CNN
F 3 "~" H 6900 1850 50  0001 C CNN
	1    6900 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW76
U 1 1 61DF2EA0
P 7900 1850
F 0 "SW76" H 7900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 7900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7900 1850 50  0001 C CNN
F 3 "~" H 7900 1850 50  0001 C CNN
	1    7900 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW80
U 1 1 61DF326F
P 8400 1850
F 0 "SW80" H 8400 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 8400 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8400 1850 50  0001 C CNN
F 3 "~" H 8400 1850 50  0001 C CNN
	1    8400 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 61DF58A2
P 1300 1100
F 0 "D2" V 1346 1021 50  0000 R CNN
F 1 "D" V 1255 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 1300 1100 50  0001 C CNN
F 3 "~" H 1300 1100 50  0001 C CNN
	1    1300 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D3
U 1 1 61DF5C86
P 1800 1100
F 0 "D3" V 1846 1021 50  0000 R CNN
F 1 "D" V 1755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 1800 1100 50  0001 C CNN
F 3 "~" H 1800 1100 50  0001 C CNN
	1    1800 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D4
U 1 1 61DF602E
P 2300 1100
F 0 "D4" V 2346 1021 50  0000 R CNN
F 1 "D" V 2255 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 2300 1100 50  0001 C CNN
F 3 "~" H 2300 1100 50  0001 C CNN
	1    2300 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D5
U 1 1 61DF650C
P 2800 1100
F 0 "D5" V 2846 1021 50  0000 R CNN
F 1 "D" V 2755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 2800 1100 50  0001 C CNN
F 3 "~" H 2800 1100 50  0001 C CNN
	1    2800 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D6
U 1 1 61DF6A07
P 3300 1100
F 0 "D6" V 3346 1021 50  0000 R CNN
F 1 "D" V 3255 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 3300 1100 50  0001 C CNN
F 3 "~" H 3300 1100 50  0001 C CNN
	1    3300 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D7
U 1 1 61DF6EB8
P 3800 1100
F 0 "D7" V 3846 1021 50  0000 R CNN
F 1 "D" V 3755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 3800 1100 50  0001 C CNN
F 3 "~" H 3800 1100 50  0001 C CNN
	1    3800 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D8
U 1 1 61DF73D7
P 4300 1100
F 0 "D8" V 4346 1021 50  0000 R CNN
F 1 "D" V 4255 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 4300 1100 50  0001 C CNN
F 3 "~" H 4300 1100 50  0001 C CNN
	1    4300 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D9
U 1 1 61DF786F
P 4800 1100
F 0 "D9" V 4846 1021 50  0000 R CNN
F 1 "D" V 4755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 4800 1100 50  0001 C CNN
F 3 "~" H 4800 1100 50  0001 C CNN
	1    4800 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D10
U 1 1 61DF7CC6
P 5300 1100
F 0 "D10" V 5346 1021 50  0000 R CNN
F 1 "D" V 5255 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 5300 1100 50  0001 C CNN
F 3 "~" H 5300 1100 50  0001 C CNN
	1    5300 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D11
U 1 1 61DF8041
P 5800 1100
F 0 "D11" V 5846 1021 50  0000 R CNN
F 1 "D" V 5755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 5800 1100 50  0001 C CNN
F 3 "~" H 5800 1100 50  0001 C CNN
	1    5800 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D12
U 1 1 61DF8579
P 6300 1100
F 0 "D12" V 6346 1021 50  0000 R CNN
F 1 "D" V 6255 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 6300 1100 50  0001 C CNN
F 3 "~" H 6300 1100 50  0001 C CNN
	1    6300 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D13
U 1 1 61DF89FD
P 6800 1100
F 0 "D13" V 6846 1021 50  0000 R CNN
F 1 "D" V 6755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 6800 1100 50  0001 C CNN
F 3 "~" H 6800 1100 50  0001 C CNN
	1    6800 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D14
U 1 1 61DF8D32
P 7300 1100
F 0 "D14" V 7346 1021 50  0000 R CNN
F 1 "D" V 7255 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 7300 1100 50  0001 C CNN
F 3 "~" H 7300 1100 50  0001 C CNN
	1    7300 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D15
U 1 1 61E09304
P 7800 1100
F 0 "D15" V 7846 1021 50  0000 R CNN
F 1 "D" V 7755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 7800 1100 50  0001 C CNN
F 3 "~" H 7800 1100 50  0001 C CNN
	1    7800 1100
	0    -1   -1   0   
$EndComp
Text Notes 1800 1550 0    50   ~ 0
F2
Text Notes 2300 1550 0    50   ~ 0
F3
Text Notes 2800 1550 0    50   ~ 0
F4
Text Notes 3300 1550 0    50   ~ 0
F5
Text Notes 3800 1550 0    50   ~ 0
F6
Text Notes 4300 1550 0    50   ~ 0
F7
Text Notes 4800 1550 0    50   ~ 0
F8
Text Notes 5300 1550 0    50   ~ 0
F9
Text Notes 5800 1550 0    50   ~ 0
F10
Text Notes 6300 1550 0    50   ~ 0
F11
Text Notes 6800 1550 0    50   ~ 0
F12
Text Notes 7800 1550 0    50   ~ 0
prnt
Text Notes 8300 1550 0    50   ~ 0
scr
$Comp
L Device:D D16
U 1 1 61E0A7D4
P 8300 1100
F 0 "D16" V 8346 1021 50  0000 R CNN
F 1 "D" V 8255 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 8300 1100 50  0001 C CNN
F 3 "~" H 8300 1100 50  0001 C CNN
	1    8300 1100
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push_45deg SW85
U 1 1 61E0AD16
P 8900 1850
F 0 "SW85" H 8900 2039 50  0000 C CNN
F 1 "SW_Push_45deg" H 8900 2040 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8900 1850 50  0001 C CNN
F 3 "~" H 8900 1850 50  0001 C CNN
	1    8900 1850
	1    0    0    -1  
$EndComp
Text Notes 8800 1550 0    50   ~ 0
pause
$Comp
L Switch:SW_Push_45deg SW3
U 1 1 61E0B2E7
P 900 2900
F 0 "SW3" H 900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.50u_PCB" H 900 2900 50  0001 C CNN
F 3 "~" H 900 2900 50  0001 C CNN
	1    900  2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW9
U 1 1 61E0B9F0
P 1400 2900
F 0 "SW9" H 1400 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 1400 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1400 2900 50  0001 C CNN
F 3 "~" H 1400 2900 50  0001 C CNN
	1    1400 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW15
U 1 1 61E0BE65
P 1900 2900
F 0 "SW15" H 1900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 1900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1900 2900 50  0001 C CNN
F 3 "~" H 1900 2900 50  0001 C CNN
	1    1900 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW21
U 1 1 61E0C1DF
P 2400 2900
F 0 "SW21" H 2400 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 2400 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2400 2900 50  0001 C CNN
F 3 "~" H 2400 2900 50  0001 C CNN
	1    2400 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW27
U 1 1 61E0FE16
P 2900 2900
F 0 "SW27" H 2900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 2900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2900 2900 50  0001 C CNN
F 3 "~" H 2900 2900 50  0001 C CNN
	1    2900 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW33
U 1 1 61E0FE1C
P 3400 2900
F 0 "SW33" H 3400 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 3400 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3400 2900 50  0001 C CNN
F 3 "~" H 3400 2900 50  0001 C CNN
	1    3400 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW39
U 1 1 61E0FE22
P 3900 2900
F 0 "SW39" H 3900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 3900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3900 2900 50  0001 C CNN
F 3 "~" H 3900 2900 50  0001 C CNN
	1    3900 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW45
U 1 1 61E0FE28
P 4400 2900
F 0 "SW45" H 4400 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 4400 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4400 2900 50  0001 C CNN
F 3 "~" H 4400 2900 50  0001 C CNN
	1    4400 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW50
U 1 1 61E12851
P 4900 2900
F 0 "SW50" H 4900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 4900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4900 2900 50  0001 C CNN
F 3 "~" H 4900 2900 50  0001 C CNN
	1    4900 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW55
U 1 1 61E12857
P 5400 2900
F 0 "SW55" H 5400 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 5400 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5400 2900 50  0001 C CNN
F 3 "~" H 5400 2900 50  0001 C CNN
	1    5400 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW60
U 1 1 61E1285D
P 5900 2900
F 0 "SW60" H 5900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 5900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5900 2900 50  0001 C CNN
F 3 "~" H 5900 2900 50  0001 C CNN
	1    5900 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW65
U 1 1 61E12863
P 6400 2900
F 0 "SW65" H 6400 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 6400 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6400 2900 50  0001 C CNN
F 3 "~" H 6400 2900 50  0001 C CNN
	1    6400 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW70
U 1 1 61E1462E
P 6900 2900
F 0 "SW70" H 6900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 6900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6900 2900 50  0001 C CNN
F 3 "~" H 6900 2900 50  0001 C CNN
	1    6900 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW74
U 1 1 61E14634
P 7400 2900
F 0 "SW74" H 7400 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 7400 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_ISOEnter_PCB" H 7400 2900 50  0001 C CNN
F 3 "~" H 7400 2900 50  0001 C CNN
	1    7400 2900
	1    0    0    -1  
$EndComp
Text Notes 800  2650 0    50   ~ 0
TAB
Text Notes 1300 2650 0    50   ~ 0
Q
Text Notes 1800 2650 0    50   ~ 0
W
Text Notes 2300 2650 0    50   ~ 0
E
Text Notes 2800 2650 0    50   ~ 0
R
Text Notes 3300 2650 0    50   ~ 0
T
Text Notes 3800 2650 0    50   ~ 0
Y
Text Notes 4300 2650 0    50   ~ 0
U
Text Notes 4800 2650 0    50   ~ 0
I
Text Notes 5300 2650 0    50   ~ 0
O
Text Notes 5800 2650 0    50   ~ 0
P
Text Notes 6300 2650 0    50   ~ 0
{
Text Notes 6800 2650 0    50   ~ 0
}
Text Notes 7300 2650 0    50   ~ 0
Enter
$Comp
L Switch:SW_Push_45deg SW2
U 1 1 61E3753A
P 900 2400
F 0 "SW2" H 900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 900 2400 50  0001 C CNN
F 3 "~" H 900 2400 50  0001 C CNN
	1    900  2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW8
U 1 1 61E37540
P 1400 2400
F 0 "SW8" H 1400 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 1400 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1400 2400 50  0001 C CNN
F 3 "~" H 1400 2400 50  0001 C CNN
	1    1400 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW14
U 1 1 61E37546
P 1900 2400
F 0 "SW14" H 1900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 1900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1900 2400 50  0001 C CNN
F 3 "~" H 1900 2400 50  0001 C CNN
	1    1900 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW20
U 1 1 61E3754C
P 2400 2400
F 0 "SW20" H 2400 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 2400 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2400 2400 50  0001 C CNN
F 3 "~" H 2400 2400 50  0001 C CNN
	1    2400 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW26
U 1 1 61E37552
P 2900 2400
F 0 "SW26" H 2900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 2900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2900 2400 50  0001 C CNN
F 3 "~" H 2900 2400 50  0001 C CNN
	1    2900 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW32
U 1 1 61E37558
P 3400 2400
F 0 "SW32" H 3400 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 3400 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3400 2400 50  0001 C CNN
F 3 "~" H 3400 2400 50  0001 C CNN
	1    3400 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW38
U 1 1 61E3755E
P 3900 2400
F 0 "SW38" H 3900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 3900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3900 2400 50  0001 C CNN
F 3 "~" H 3900 2400 50  0001 C CNN
	1    3900 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW44
U 1 1 61E37564
P 4400 2400
F 0 "SW44" H 4400 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 4400 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4400 2400 50  0001 C CNN
F 3 "~" H 4400 2400 50  0001 C CNN
	1    4400 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW49
U 1 1 61E3756A
P 4900 2400
F 0 "SW49" H 4900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 4900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4900 2400 50  0001 C CNN
F 3 "~" H 4900 2400 50  0001 C CNN
	1    4900 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW54
U 1 1 61E37570
P 5400 2400
F 0 "SW54" H 5400 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 5400 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5400 2400 50  0001 C CNN
F 3 "~" H 5400 2400 50  0001 C CNN
	1    5400 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW59
U 1 1 61E37576
P 5900 2400
F 0 "SW59" H 5900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 5900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5900 2400 50  0001 C CNN
F 3 "~" H 5900 2400 50  0001 C CNN
	1    5900 2400
	1    0    0    -1  
$EndComp
Text Notes 800  2100 0    50   ~ 0
`
Text Notes 1300 2100 0    50   ~ 0
1
$Comp
L Switch:SW_Push_45deg SW64
U 1 1 61E3757E
P 6400 2400
F 0 "SW64" H 6400 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 6400 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6400 2400 50  0001 C CNN
F 3 "~" H 6400 2400 50  0001 C CNN
	1    6400 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW69
U 1 1 61E37584
P 6900 2400
F 0 "SW69" H 6900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 6900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6900 2400 50  0001 C CNN
F 3 "~" H 6900 2400 50  0001 C CNN
	1    6900 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW73
U 1 1 61E3758A
P 7400 2400
F 0 "SW73" H 7400 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 7400 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_2.00u_PCB" H 7400 2400 50  0001 C CNN
F 3 "~" H 7400 2400 50  0001 C CNN
	1    7400 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW77
U 1 1 61E37590
P 7900 2400
F 0 "SW77" H 7900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 7900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7900 2400 50  0001 C CNN
F 3 "~" H 7900 2400 50  0001 C CNN
	1    7900 2400
	1    0    0    -1  
$EndComp
Text Notes 1800 2100 0    50   ~ 0
2
Text Notes 2300 2100 0    50   ~ 0
3
Text Notes 2800 2100 0    50   ~ 0
4
Text Notes 3300 2100 0    50   ~ 0
5
Text Notes 3800 2100 0    50   ~ 0
6
Text Notes 4300 2100 0    50   ~ 0
7
Text Notes 4800 2100 0    50   ~ 0
8
Text Notes 5300 2100 0    50   ~ 0
9
Text Notes 5800 2100 0    50   ~ 0
0
Text Notes 6300 2100 0    50   ~ 0
-
Text Notes 6800 2100 0    50   ~ 0
=
Text Notes 7300 2100 0    50   ~ 0
backspace
Text Notes 7800 2100 0    50   ~ 0
insert
$Comp
L Switch:SW_Push_45deg SW81
U 1 1 61E375A3
P 8400 2400
F 0 "SW81" H 8400 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 8400 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8400 2400 50  0001 C CNN
F 3 "~" H 8400 2400 50  0001 C CNN
	1    8400 2400
	1    0    0    -1  
$EndComp
Text Notes 8300 2100 0    50   ~ 0
home
$Comp
L Switch:SW_Push_45deg SW86
U 1 1 61E5E756
P 8900 2400
F 0 "SW86" H 8900 2589 50  0000 C CNN
F 1 "SW_Push_45deg" H 8900 2590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8900 2400 50  0001 C CNN
F 3 "~" H 8900 2400 50  0001 C CNN
	1    8900 2400
	1    0    0    -1  
$EndComp
Text Notes 8800 2100 0    50   ~ 0
pg up
$Comp
L Device:D D17
U 1 1 61E5F247
P 8800 1100
F 0 "D17" V 8846 1021 50  0000 R CNN
F 1 "D" V 8755 1021 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 8800 1100 50  0001 C CNN
F 3 "~" H 8800 1100 50  0001 C CNN
	1    8800 1100
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push_45deg SW78
U 1 1 61E627C7
P 7900 2900
F 0 "SW78" H 7900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 7900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7900 2900 50  0001 C CNN
F 3 "~" H 7900 2900 50  0001 C CNN
	1    7900 2900
	1    0    0    -1  
$EndComp
Text Notes 7800 2650 0    50   ~ 0
del
$Comp
L Switch:SW_Push_45deg SW82
U 1 1 61E627CE
P 8400 2900
F 0 "SW82" H 8400 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 8400 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8400 2900 50  0001 C CNN
F 3 "~" H 8400 2900 50  0001 C CNN
	1    8400 2900
	1    0    0    -1  
$EndComp
Text Notes 8300 2650 0    50   ~ 0
end
$Comp
L Switch:SW_Push_45deg SW87
U 1 1 61E627D5
P 8900 2900
F 0 "SW87" H 8900 3089 50  0000 C CNN
F 1 "SW_Push_45deg" H 8900 3090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8900 2900 50  0001 C CNN
F 3 "~" H 8900 2900 50  0001 C CNN
	1    8900 2900
	1    0    0    -1  
$EndComp
Text Notes 8800 2650 0    50   ~ 0
pg down
$Comp
L Switch:SW_Push_45deg SW4
U 1 1 61F1E119
P 900 3400
F 0 "SW4" H 900 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 900 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.75u_PCB" H 900 3400 50  0001 C CNN
F 3 "~" H 900 3400 50  0001 C CNN
	1    900  3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW10
U 1 1 61F1E11F
P 1400 3400
F 0 "SW10" H 1400 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 1400 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1400 3400 50  0001 C CNN
F 3 "~" H 1400 3400 50  0001 C CNN
	1    1400 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW16
U 1 1 61F1E125
P 1900 3400
F 0 "SW16" H 1900 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 1900 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1900 3400 50  0001 C CNN
F 3 "~" H 1900 3400 50  0001 C CNN
	1    1900 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW22
U 1 1 61F1E12B
P 2400 3400
F 0 "SW22" H 2400 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 2400 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2400 3400 50  0001 C CNN
F 3 "~" H 2400 3400 50  0001 C CNN
	1    2400 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW28
U 1 1 61F1E131
P 2900 3400
F 0 "SW28" H 2900 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 2900 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2900 3400 50  0001 C CNN
F 3 "~" H 2900 3400 50  0001 C CNN
	1    2900 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW34
U 1 1 61F1E137
P 3400 3400
F 0 "SW34" H 3400 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 3400 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3400 3400 50  0001 C CNN
F 3 "~" H 3400 3400 50  0001 C CNN
	1    3400 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW40
U 1 1 61F1E13D
P 3900 3400
F 0 "SW40" H 3900 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 3900 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3900 3400 50  0001 C CNN
F 3 "~" H 3900 3400 50  0001 C CNN
	1    3900 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW46
U 1 1 61F1E143
P 4400 3400
F 0 "SW46" H 4400 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 4400 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4400 3400 50  0001 C CNN
F 3 "~" H 4400 3400 50  0001 C CNN
	1    4400 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW51
U 1 1 61F1E149
P 4900 3400
F 0 "SW51" H 4900 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 4900 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4900 3400 50  0001 C CNN
F 3 "~" H 4900 3400 50  0001 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW56
U 1 1 61F1E14F
P 5400 3400
F 0 "SW56" H 5400 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 5400 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5400 3400 50  0001 C CNN
F 3 "~" H 5400 3400 50  0001 C CNN
	1    5400 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW61
U 1 1 61F1E155
P 5900 3400
F 0 "SW61" H 5900 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 5900 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5900 3400 50  0001 C CNN
F 3 "~" H 5900 3400 50  0001 C CNN
	1    5900 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW66
U 1 1 61F1E15B
P 6400 3400
F 0 "SW66" H 6400 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 6400 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6400 3400 50  0001 C CNN
F 3 "~" H 6400 3400 50  0001 C CNN
	1    6400 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW71
U 1 1 61F1E161
P 6900 3400
F 0 "SW71" H 6900 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 6900 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6900 3400 50  0001 C CNN
F 3 "~" H 6900 3400 50  0001 C CNN
	1    6900 3400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW83
U 1 1 61F1E167
P 8400 3400
F 0 "SW83" H 8400 3589 50  0000 C CNN
F 1 "SW_Push_45deg" H 8400 3590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8400 3400 50  0001 C CNN
F 3 "~" H 8400 3400 50  0001 C CNN
	1    8400 3400
	1    0    0    -1  
$EndComp
Text Notes 800  3150 0    50   ~ 0
caps
Text Notes 1300 3150 0    50   ~ 0
A
Text Notes 1800 3150 0    50   ~ 0
S
Text Notes 2300 3150 0    50   ~ 0
D
Text Notes 2800 3150 0    50   ~ 0
F
Text Notes 3300 3150 0    50   ~ 0
G
Text Notes 3800 3150 0    50   ~ 0
H
Text Notes 4300 3150 0    50   ~ 0
J
Text Notes 4800 3150 0    50   ~ 0
K
Text Notes 5300 3150 0    50   ~ 0
L
Text Notes 5800 3150 0    50   ~ 0
;
Text Notes 6300 3150 0    50   ~ 0
'
Text Notes 6800 3150 0    50   ~ 0
\
Text Notes 8300 3150 0    50   ~ 0
up
$Comp
L Switch:SW_Push_45deg SW5
U 1 1 61F34D0B
P 900 3900
F 0 "SW5" H 900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.25u_PCB" H 900 3900 50  0001 C CNN
F 3 "~" H 900 3900 50  0001 C CNN
	1    900  3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW11
U 1 1 61F34D11
P 1400 3900
F 0 "SW11" H 1400 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 1400 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1400 3900 50  0001 C CNN
F 3 "~" H 1400 3900 50  0001 C CNN
	1    1400 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW17
U 1 1 61F34D17
P 1900 3900
F 0 "SW17" H 1900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 1900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1900 3900 50  0001 C CNN
F 3 "~" H 1900 3900 50  0001 C CNN
	1    1900 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW23
U 1 1 61F34D1D
P 2400 3900
F 0 "SW23" H 2400 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 2400 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2400 3900 50  0001 C CNN
F 3 "~" H 2400 3900 50  0001 C CNN
	1    2400 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW29
U 1 1 61F34D23
P 2900 3900
F 0 "SW29" H 2900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 2900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2900 3900 50  0001 C CNN
F 3 "~" H 2900 3900 50  0001 C CNN
	1    2900 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW35
U 1 1 61F34D29
P 3400 3900
F 0 "SW35" H 3400 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 3400 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3400 3900 50  0001 C CNN
F 3 "~" H 3400 3900 50  0001 C CNN
	1    3400 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW41
U 1 1 61F34D2F
P 3900 3900
F 0 "SW41" H 3900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 3900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 3900 3900 50  0001 C CNN
F 3 "~" H 3900 3900 50  0001 C CNN
	1    3900 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW47
U 1 1 61F34D35
P 4400 3900
F 0 "SW47" H 4400 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 4400 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4400 3900 50  0001 C CNN
F 3 "~" H 4400 3900 50  0001 C CNN
	1    4400 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW52
U 1 1 61F34D3B
P 4900 3900
F 0 "SW52" H 4900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 4900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4900 3900 50  0001 C CNN
F 3 "~" H 4900 3900 50  0001 C CNN
	1    4900 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW57
U 1 1 61F34D41
P 5400 3900
F 0 "SW57" H 5400 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 5400 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5400 3900 50  0001 C CNN
F 3 "~" H 5400 3900 50  0001 C CNN
	1    5400 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW62
U 1 1 61F34D47
P 5900 3900
F 0 "SW62" H 5900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 5900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5900 3900 50  0001 C CNN
F 3 "~" H 5900 3900 50  0001 C CNN
	1    5900 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW67
U 1 1 61F34D4D
P 6400 3900
F 0 "SW67" H 6400 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 6400 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6400 3900 50  0001 C CNN
F 3 "~" H 6400 3900 50  0001 C CNN
	1    6400 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW72
U 1 1 61F34D53
P 6900 3900
F 0 "SW72" H 6900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 6900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_2.75u_PCB" H 6900 3900 50  0001 C CNN
F 3 "~" H 6900 3900 50  0001 C CNN
	1    6900 3900
	1    0    0    -1  
$EndComp
Text Notes 800  3650 0    50   ~ 0
shift
Text Notes 1300 3650 0    50   ~ 0
\
Text Notes 1800 3650 0    50   ~ 0
Z
Text Notes 2300 3650 0    50   ~ 0
X
Text Notes 2800 3650 0    50   ~ 0
C
Text Notes 3300 3650 0    50   ~ 0
V
Text Notes 3800 3650 0    50   ~ 0
B
Text Notes 4300 3650 0    50   ~ 0
N
Text Notes 4800 3650 0    50   ~ 0
M
Text Notes 5300 3650 0    50   ~ 0
,
Text Notes 5800 3650 0    50   ~ 0
.
Text Notes 6300 3650 0    50   ~ 0
/
Text Notes 6800 3650 0    50   ~ 0
shift
$Comp
L Switch:SW_Push_45deg SW79
U 1 1 61F37513
P 7900 3900
F 0 "SW79" H 7900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 7900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7900 3900 50  0001 C CNN
F 3 "~" H 7900 3900 50  0001 C CNN
	1    7900 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW84
U 1 1 61F37519
P 8400 3900
F 0 "SW84" H 8400 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 8400 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8400 3900 50  0001 C CNN
F 3 "~" H 8400 3900 50  0001 C CNN
	1    8400 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_45deg SW88
U 1 1 61F3751F
P 8900 3900
F 0 "SW88" H 8900 4089 50  0000 C CNN
F 1 "SW_Push_45deg" H 8900 4090 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8900 3900 50  0001 C CNN
F 3 "~" H 8900 3900 50  0001 C CNN
	1    8900 3900
	1    0    0    -1  
$EndComp
Text Notes 7800 3650 0    50   ~ 0
left
Text Notes 8300 3650 0    50   ~ 0
down
Text Notes 8800 3650 0    50   ~ 0
right
$Comp
L Switch:SW_Push_45deg SW6
U 1 1 61F3BA8B
P 900 4400
F 0 "SW6" H 900 4589 50  0000 C CNN
F 1 "SW_Push_45deg" H 900 4590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.50u_PCB" H 900 4400 50  0001 C CNN
F 3 "~" H 900 4400 50  0001 C CNN
	1    900  4400
	1    0    0    -1  
$EndComp
Text Notes 800  4150 0    50   ~ 0
ctrl
$Comp
L Switch:SW_Push_45deg SW12
U 1 1 61F3C7FF
P 1400 4400
F 0 "SW12" H 1400 4589 50  0000 C CNN
F 1 "SW_Push_45deg" H 1400 4590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.25u_PCB" H 1400 4400 50  0001 C CNN
F 3 "~" H 1400 4400 50  0001 C CNN
	1    1400 4400
	1    0    0    -1  
$EndComp
Text Notes 1300 4150 0    50   ~ 0
win
$Comp
L Switch:SW_Push_45deg SW18
U 1 1 61F3D27B
P 1900 4400
F 0 "SW18" H 1900 4589 50  0000 C CNN
F 1 "SW_Push_45deg" H 1900 4590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.25u_PCB" H 1900 4400 50  0001 C CNN
F 3 "~" H 1900 4400 50  0001 C CNN
	1    1900 4400
	1    0    0    -1  
$EndComp
Text Notes 1800 4150 0    50   ~ 0
alt
$Comp
L Switch:SW_Push_45deg SW24
U 1 1 61F3DD75
P 3900 4400
F 0 "SW24" H 3900 4589 50  0000 C CNN
F 1 "SW_Push_45deg" H 3900 4590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_6.25u_PCB" H 3900 4400 50  0001 C CNN
F 3 "~" H 3900 4400 50  0001 C CNN
	1    3900 4400
	1    0    0    -1  
$EndComp
Text Notes 3800 4150 0    50   ~ 0
space
$Comp
L Switch:SW_Push_45deg SW30
U 1 1 61F40753
P 5900 4400
F 0 "SW30" H 5900 4589 50  0000 C CNN
F 1 "SW_Push_45deg" H 5900 4590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.50u_PCB" H 5900 4400 50  0001 C CNN
F 3 "~" H 5900 4400 50  0001 C CNN
	1    5900 4400
	1    0    0    -1  
$EndComp
Text Notes 5800 4150 0    50   ~ 0
alt
$Comp
L Switch:SW_Push_45deg SW36
U 1 1 61F4169F
P 6400 4400
F 0 "SW36" H 6400 4589 50  0000 C CNN
F 1 "SW_Push_45deg" H 6400 4590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.50u_PCB" H 6400 4400 50  0001 C CNN
F 3 "~" H 6400 4400 50  0001 C CNN
	1    6400 4400
	1    0    0    -1  
$EndComp
Text Notes 6300 4150 0    50   ~ 0
menu
$Comp
L Switch:SW_Push_45deg SW42
U 1 1 61F427F8
P 6900 4400
F 0 "SW42" H 6900 4589 50  0000 C CNN
F 1 "SW_Push_45deg" H 6900 4590 50  0001 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.50u_PCB" H 6900 4400 50  0001 C CNN
F 3 "~" H 6900 4400 50  0001 C CNN
	1    6900 4400
	1    0    0    -1  
$EndComp
Text Notes 6800 4150 0    50   ~ 0
ctrl
Wire Wire Line
	800  1250 800  1750
Connection ~ 800  1750
Wire Wire Line
	800  1750 800  2300
Connection ~ 800  2300
Wire Wire Line
	800  2300 800  2800
Connection ~ 800  2800
Wire Wire Line
	800  2800 800  3300
Connection ~ 800  3300
Wire Wire Line
	800  3300 800  3800
Connection ~ 800  3800
Wire Wire Line
	800  3800 800  4300
Wire Wire Line
	1300 1250 1300 1750
Connection ~ 1300 1750
Wire Wire Line
	1300 1750 1300 2300
Connection ~ 1300 2300
Wire Wire Line
	1300 2300 1300 2800
Connection ~ 1300 2800
Wire Wire Line
	1300 2800 1300 3300
Connection ~ 1300 3300
Wire Wire Line
	1300 3300 1300 3800
Connection ~ 1300 3800
Wire Wire Line
	1300 3800 1300 4300
Wire Wire Line
	1800 1250 1800 1750
Connection ~ 1800 1750
Wire Wire Line
	1800 1750 1800 2300
Connection ~ 1800 2300
Wire Wire Line
	1800 2300 1800 2800
Connection ~ 1800 2800
Wire Wire Line
	1800 2800 1800 3300
Connection ~ 1800 3300
Wire Wire Line
	1800 3300 1800 3800
Connection ~ 1800 3800
Wire Wire Line
	1800 3800 1800 4300
Wire Wire Line
	2300 1250 2300 1750
Connection ~ 2300 1750
Wire Wire Line
	2300 1750 2300 2300
Connection ~ 2300 2300
Wire Wire Line
	2300 2300 2300 2800
Connection ~ 2300 2800
Wire Wire Line
	2300 2800 2300 3300
Connection ~ 2300 3300
Wire Wire Line
	2300 3300 2300 3800
Wire Wire Line
	2800 1250 2800 1750
Connection ~ 2800 1750
Wire Wire Line
	2800 1750 2800 2300
Connection ~ 2800 2300
Wire Wire Line
	2800 2300 2800 2800
Connection ~ 2800 2800
Wire Wire Line
	2800 2800 2800 3300
Connection ~ 2800 3300
Wire Wire Line
	2800 3300 2800 3800
Connection ~ 3300 1750
Wire Wire Line
	3300 1750 3300 1250
Connection ~ 3300 2300
Wire Wire Line
	3300 2300 3300 1750
Connection ~ 3300 2800
Wire Wire Line
	3300 2800 3300 2300
Connection ~ 3300 3300
Wire Wire Line
	3300 3300 3300 2800
Wire Wire Line
	3300 3800 3300 3300
Wire Wire Line
	3800 1250 3800 1750
Connection ~ 3800 1750
Wire Wire Line
	3800 1750 3800 2300
Connection ~ 3800 2300
Wire Wire Line
	3800 2300 3800 2800
Connection ~ 3800 2800
Wire Wire Line
	3800 2800 3800 3300
Connection ~ 3800 3300
Wire Wire Line
	3800 3300 3800 3800
Wire Wire Line
	4300 3800 4300 3300
Connection ~ 4300 1750
Wire Wire Line
	4300 1750 4300 1250
Connection ~ 4300 2300
Wire Wire Line
	4300 2300 4300 1750
Connection ~ 4300 2800
Wire Wire Line
	4300 2800 4300 2300
Connection ~ 4300 3300
Wire Wire Line
	4300 3300 4300 2800
Wire Wire Line
	4800 1250 4800 1750
Connection ~ 4800 1750
Wire Wire Line
	4800 1750 4800 2300
Connection ~ 4800 2300
Wire Wire Line
	4800 2300 4800 2800
Connection ~ 4800 2800
Wire Wire Line
	4800 2800 4800 3300
Connection ~ 4800 3300
Wire Wire Line
	5300 1250 5300 1750
Connection ~ 5300 1750
Wire Wire Line
	5300 1750 5300 2300
Connection ~ 5300 2300
Wire Wire Line
	5300 2300 5300 2800
Connection ~ 5300 2800
Wire Wire Line
	5300 2800 5300 3300
Connection ~ 5300 3300
Wire Wire Line
	5300 3300 5300 3800
Wire Wire Line
	5800 3800 5800 3300
Connection ~ 5800 1750
Wire Wire Line
	5800 1750 5800 1250
Connection ~ 5800 2300
Wire Wire Line
	5800 2300 5800 1750
Connection ~ 5800 2800
Wire Wire Line
	5800 2800 5800 2300
Connection ~ 5800 3300
Wire Wire Line
	5800 3300 5800 2800
Wire Wire Line
	6300 1250 6300 1750
Connection ~ 6300 1750
Wire Wire Line
	6300 1750 6300 2300
Connection ~ 6300 2300
Wire Wire Line
	6300 2300 6300 2800
Connection ~ 6300 2800
Wire Wire Line
	6300 2800 6300 3300
Connection ~ 6300 3300
Wire Wire Line
	6300 3300 6300 3800
Wire Wire Line
	6800 3800 6800 3300
Connection ~ 6800 1750
Wire Wire Line
	6800 1750 6800 1250
Connection ~ 6800 2300
Wire Wire Line
	6800 2300 6800 1750
Connection ~ 6800 2800
Wire Wire Line
	6800 2800 6800 2300
Connection ~ 6800 3300
Wire Wire Line
	6800 3300 6800 2800
Wire Wire Line
	7300 1250 7300 2300
Connection ~ 7300 2300
Wire Wire Line
	7300 2300 7300 2800
Wire Wire Line
	7800 3800 7800 2800
Connection ~ 7800 1750
Wire Wire Line
	7800 1750 7800 1250
Connection ~ 7800 2300
Wire Wire Line
	7800 2300 7800 1750
Connection ~ 7800 2800
Wire Wire Line
	7800 2800 7800 2300
Wire Wire Line
	8300 3800 8300 3300
Connection ~ 8300 1750
Wire Wire Line
	8300 1750 8300 1250
Connection ~ 8300 2300
Wire Wire Line
	8300 2300 8300 1750
Connection ~ 8300 2800
Wire Wire Line
	8300 2800 8300 2300
Connection ~ 8300 3300
Wire Wire Line
	8300 3300 8300 2800
Wire Wire Line
	8800 1250 8800 1750
Connection ~ 8800 1750
Wire Wire Line
	8800 1750 8800 2300
Connection ~ 8800 2300
Wire Wire Line
	8800 2300 8800 2800
Connection ~ 8800 2800
Wire Wire Line
	8800 2800 8800 3800
Wire Wire Line
	1000 1950 1500 1950
Connection ~ 1500 1950
Wire Wire Line
	1500 1950 2000 1950
Connection ~ 2000 1950
Wire Wire Line
	2000 1950 2500 1950
Connection ~ 2500 1950
Wire Wire Line
	2500 1950 3000 1950
Connection ~ 3000 1950
Wire Wire Line
	3000 1950 3500 1950
Connection ~ 3500 1950
Wire Wire Line
	3500 1950 4000 1950
Connection ~ 4000 1950
Wire Wire Line
	4000 1950 4500 1950
Connection ~ 4500 1950
Wire Wire Line
	4500 1950 5000 1950
Connection ~ 5000 1950
Wire Wire Line
	5000 1950 5500 1950
Connection ~ 5500 1950
Wire Wire Line
	5500 1950 6000 1950
Connection ~ 6000 1950
Wire Wire Line
	6000 1950 6500 1950
Connection ~ 6500 1950
Wire Wire Line
	6500 1950 7000 1950
Connection ~ 7000 1950
Wire Wire Line
	7000 1950 8000 1950
Connection ~ 8000 1950
Wire Wire Line
	8000 1950 8500 1950
Connection ~ 8500 1950
Wire Wire Line
	8500 1950 9000 1950
Wire Wire Line
	9000 2500 8500 2500
Connection ~ 1500 2500
Wire Wire Line
	1500 2500 1000 2500
Connection ~ 2000 2500
Wire Wire Line
	2000 2500 1500 2500
Connection ~ 2500 2500
Wire Wire Line
	2500 2500 2000 2500
Connection ~ 3000 2500
Wire Wire Line
	3000 2500 2500 2500
Connection ~ 3500 2500
Wire Wire Line
	3500 2500 3000 2500
Connection ~ 4000 2500
Wire Wire Line
	4000 2500 3500 2500
Connection ~ 4500 2500
Wire Wire Line
	4500 2500 4000 2500
Connection ~ 5000 2500
Wire Wire Line
	5000 2500 4500 2500
Connection ~ 5500 2500
Wire Wire Line
	5500 2500 5000 2500
Connection ~ 6000 2500
Wire Wire Line
	6000 2500 5500 2500
Connection ~ 6500 2500
Wire Wire Line
	6500 2500 6000 2500
Connection ~ 7000 2500
Wire Wire Line
	7000 2500 6500 2500
Connection ~ 7500 2500
Wire Wire Line
	7500 2500 7000 2500
Connection ~ 8000 2500
Wire Wire Line
	8000 2500 7500 2500
Connection ~ 8500 2500
Wire Wire Line
	8500 2500 8000 2500
Wire Wire Line
	1000 3000 1500 3000
Connection ~ 1500 3000
Wire Wire Line
	1500 3000 2000 3000
Connection ~ 2000 3000
Wire Wire Line
	2000 3000 2500 3000
Connection ~ 2500 3000
Wire Wire Line
	2500 3000 3000 3000
Connection ~ 3000 3000
Wire Wire Line
	3000 3000 3500 3000
Connection ~ 3500 3000
Wire Wire Line
	3500 3000 4000 3000
Connection ~ 4000 3000
Wire Wire Line
	4000 3000 4500 3000
Connection ~ 4500 3000
Wire Wire Line
	4500 3000 5000 3000
Connection ~ 5000 3000
Wire Wire Line
	5000 3000 5500 3000
Connection ~ 5500 3000
Wire Wire Line
	5500 3000 6000 3000
Connection ~ 6000 3000
Wire Wire Line
	6000 3000 6500 3000
Connection ~ 6500 3000
Wire Wire Line
	6500 3000 7000 3000
Connection ~ 7000 3000
Wire Wire Line
	7000 3000 7500 3000
Connection ~ 7500 3000
Wire Wire Line
	7500 3000 8000 3000
Connection ~ 8000 3000
Wire Wire Line
	8000 3000 8500 3000
Connection ~ 8500 3000
Wire Wire Line
	8500 3000 9000 3000
Wire Wire Line
	1500 3500 2000 3500
Connection ~ 2000 3500
Wire Wire Line
	2000 3500 2500 3500
Connection ~ 2500 3500
Wire Wire Line
	2500 3500 3000 3500
Connection ~ 3000 3500
Wire Wire Line
	3000 3500 3500 3500
Connection ~ 3500 3500
Wire Wire Line
	3500 3500 4000 3500
Connection ~ 4000 3500
Wire Wire Line
	4000 3500 4500 3500
Connection ~ 4500 3500
Wire Wire Line
	4500 3500 5000 3500
Connection ~ 5000 3500
Wire Wire Line
	5000 3500 5500 3500
Connection ~ 5500 3500
Wire Wire Line
	5500 3500 6000 3500
Connection ~ 6000 3500
Wire Wire Line
	6000 3500 6500 3500
Connection ~ 6500 3500
Wire Wire Line
	6500 3500 7000 3500
Connection ~ 7000 3500
Wire Wire Line
	7000 3500 8500 3500
Wire Wire Line
	1500 4000 2000 4000
Connection ~ 2000 4000
Wire Wire Line
	2000 4000 2500 4000
Connection ~ 2500 4000
Wire Wire Line
	2500 4000 3000 4000
Connection ~ 3000 4000
Wire Wire Line
	3000 4000 3500 4000
Connection ~ 3500 4000
Wire Wire Line
	3500 4000 4000 4000
Connection ~ 4000 4000
Wire Wire Line
	4000 4000 4500 4000
Connection ~ 4500 4000
Wire Wire Line
	4500 4000 5000 4000
Connection ~ 5000 4000
Wire Wire Line
	5000 4000 5500 4000
Connection ~ 5500 4000
Wire Wire Line
	5500 4000 6000 4000
Connection ~ 6000 4000
Wire Wire Line
	6000 4000 6500 4000
Connection ~ 6500 4000
Wire Wire Line
	6500 4000 7000 4000
Connection ~ 7000 4000
Connection ~ 8000 4000
Wire Wire Line
	8000 4000 8500 4000
Connection ~ 8500 4000
Wire Wire Line
	8500 4000 9000 4000
Wire Wire Line
	1500 4500 2000 4500
Connection ~ 6000 4500
Wire Wire Line
	6000 4500 6500 4500
Connection ~ 6500 4500
Wire Wire Line
	6500 4500 7000 4500
Wire Wire Line
	2000 4500 4000 4500
Connection ~ 2000 4500
Wire Wire Line
	3800 4300 3800 3800
Connection ~ 3800 3800
Wire Wire Line
	5800 3800 5800 4300
Wire Wire Line
	4800 3300 4800 3800
Wire Wire Line
	6300 3800 6300 4300
Wire Wire Line
	6800 3800 6800 4300
Connection ~ 5800 3800
Connection ~ 6300 3800
Connection ~ 6800 3800
Wire Wire Line
	4000 4500 6000 4500
Connection ~ 4000 4500
Wire Wire Line
	7000 4000 8000 4000
Wire Wire Line
	1000 4000 1500 4000
Connection ~ 1500 4000
Wire Wire Line
	1500 3500 1000 3500
Connection ~ 1500 3500
Wire Wire Line
	1000 4500 1500 4500
Connection ~ 1500 4500
$EndSCHEMATC
