
_buttonFreq:

;button.c,27 :: 		void buttonFreq()
;button.c,29 :: 		if(button1)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       7
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_buttonFreq0
;button.c,31 :: 		if(contT == 65535 || contT >= 65525)  contT = 65535;
	MOVF        _contT+1, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonFreq46
	MOVLW       255
	XORWF       _contT+0, 0 
L__buttonFreq46:
	BTFSC       STATUS+0, 2 
	GOTO        L__buttonFreq40
	MOVLW       255
	SUBWF       _contT+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonFreq47
	MOVLW       245
	SUBWF       _contT+0, 0 
L__buttonFreq47:
	BTFSC       STATUS+0, 0 
	GOTO        L__buttonFreq40
	GOTO        L_buttonFreq3
L__buttonFreq40:
	MOVLW       255
	MOVWF       _contT+0 
	MOVLW       255
	MOVWF       _contT+1 
	GOTO        L_buttonFreq4
L_buttonFreq3:
;button.c,32 :: 		else              contT += 10;
	MOVLW       10
	ADDWF       _contT+0, 1 
	MOVLW       0
	ADDWFC      _contT+1, 1 
L_buttonFreq4:
;button.c,33 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,34 :: 		}
L_buttonFreq0:
;button.c,36 :: 		if(button2)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       6
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_buttonFreq5
;button.c,38 :: 		if(contT == 60000 || contT <= 60010)  contT = 60000;
	MOVF        _contT+1, 0 
	XORLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonFreq48
	MOVLW       96
	XORWF       _contT+0, 0 
L__buttonFreq48:
	BTFSC       STATUS+0, 2 
	GOTO        L__buttonFreq39
	MOVF        _contT+1, 0 
	SUBLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonFreq49
	MOVF        _contT+0, 0 
	SUBLW       106
L__buttonFreq49:
	BTFSC       STATUS+0, 0 
	GOTO        L__buttonFreq39
	GOTO        L_buttonFreq8
L__buttonFreq39:
	MOVLW       96
	MOVWF       _contT+0 
	MOVLW       234
	MOVWF       _contT+1 
	GOTO        L_buttonFreq9
L_buttonFreq8:
;button.c,39 :: 		else            contT -= 10;
	MOVLW       10
	SUBWF       _contT+0, 1 
	MOVLW       0
	SUBWFB      _contT+1, 1 
L_buttonFreq9:
;button.c,40 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,41 :: 		}
L_buttonFreq5:
;button.c,43 :: 		if(button3)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_buttonFreq10
;button.c,45 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,46 :: 		}
L_buttonFreq10:
;button.c,47 :: 		}
L_end_buttonFreq:
	RETURN      0
; end of _buttonFreq

_testButtonVar:

;button.c,51 :: 		void testButtonVar()
;button.c,53 :: 		if(button1)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       7
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_testButtonVar11
;button.c,55 :: 		if(contT == 65535 || contT >= 65525)  contT = 65535;
	MOVF        _contT+1, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__testButtonVar51
	MOVLW       255
	XORWF       _contT+0, 0 
L__testButtonVar51:
	BTFSC       STATUS+0, 2 
	GOTO        L__testButtonVar42
	MOVLW       255
	SUBWF       _contT+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testButtonVar52
	MOVLW       245
	SUBWF       _contT+0, 0 
L__testButtonVar52:
	BTFSC       STATUS+0, 0 
	GOTO        L__testButtonVar42
	GOTO        L_testButtonVar14
L__testButtonVar42:
	MOVLW       255
	MOVWF       _contT+0 
	MOVLW       255
	MOVWF       _contT+1 
	GOTO        L_testButtonVar15
L_testButtonVar14:
;button.c,56 :: 		else              contT += 10;
	MOVLW       10
	ADDWF       _contT+0, 1 
	MOVLW       0
	ADDWFC      _contT+1, 1 
L_testButtonVar15:
;button.c,57 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,58 :: 		}
L_testButtonVar11:
;button.c,60 :: 		if(button2)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       6
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_testButtonVar16
;button.c,62 :: 		if(contT == 60000 || contT <= 60010)  contT = 60000;
	MOVF        _contT+1, 0 
	XORLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__testButtonVar53
	MOVLW       96
	XORWF       _contT+0, 0 
L__testButtonVar53:
	BTFSC       STATUS+0, 2 
	GOTO        L__testButtonVar41
	MOVF        _contT+1, 0 
	SUBLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__testButtonVar54
	MOVF        _contT+0, 0 
	SUBLW       106
L__testButtonVar54:
	BTFSC       STATUS+0, 0 
	GOTO        L__testButtonVar41
	GOTO        L_testButtonVar19
L__testButtonVar41:
	MOVLW       96
	MOVWF       _contT+0 
	MOVLW       234
	MOVWF       _contT+1 
	GOTO        L_testButtonVar20
L_testButtonVar19:
;button.c,63 :: 		else            contT -= 10;
	MOVLW       10
	SUBWF       _contT+0, 1 
	MOVLW       0
	SUBWFB      _contT+1, 1 
L_testButtonVar20:
;button.c,64 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,65 :: 		}
L_testButtonVar16:
;button.c,67 :: 		if(button3)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_testButtonVar21
;button.c,69 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,70 :: 		}
L_testButtonVar21:
;button.c,71 :: 		}
L_end_testButtonVar:
	RETURN      0
; end of _testButtonVar

_buttonMenu:

;button.c,75 :: 		void buttonMenu()
;button.c,77 :: 		if(button1)                     //Botao solto?
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       7
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_buttonMenu22
;button.c,79 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu23
;button.c,81 :: 		flagVoltar = 1;
	BSF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;button.c,82 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,83 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,84 :: 		}
L_buttonMenu23:
;button.c,85 :: 		}
L_buttonMenu22:
;button.c,87 :: 		if(button2)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       6
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_buttonMenu24
;button.c,89 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu25
;button.c,91 :: 		if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
	MOVF        _var_menu+0, 0 
	SUBWF       _max_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu28
	MOVF        _var_menu+0, 0 
	SUBWF       _min_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu28
L__buttonMenu44:
	DECF        _var_menu+0, 1 
	GOTO        L_buttonMenu29
L_buttonMenu28:
;button.c,92 :: 		else                             var_menu = min_menu;
	MOVF        _min_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu29:
;button.c,93 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,94 :: 		}
L_buttonMenu25:
;button.c,95 :: 		}
L_buttonMenu24:
;button.c,97 :: 		if(button3)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_buttonMenu30
;button.c,99 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu31
;button.c,101 :: 		if(var_menu < max_menu && var_menu >= 0) var_menu ++;
	MOVF        _max_menu+0, 0 
	SUBWF       _var_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu34
	MOVLW       0
	SUBWF       _var_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu34
L__buttonMenu43:
	INCF        _var_menu+0, 1 
	GOTO        L_buttonMenu35
L_buttonMenu34:
;button.c,102 :: 		else                             var_menu = max_menu;
	MOVF        _max_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu35:
;button.c,103 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,104 :: 		}
L_buttonMenu31:
;button.c,105 :: 		}
L_buttonMenu30:
;button.c,107 :: 		if(button4)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       4
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_buttonMenu36
;button.c,109 :: 		if(flaginicio == 1)
	BTFSS       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu37
;button.c,111 :: 		flaginicio = 0;
	BCF         _flaginicio+0, BitPos(_flaginicio+0) 
;button.c,112 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,113 :: 		}else
	GOTO        L_buttonMenu38
L_buttonMenu37:
;button.c,115 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,116 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,117 :: 		}
L_buttonMenu38:
;button.c,118 :: 		}
L_buttonMenu36:
;button.c,119 :: 		}
L_end_buttonMenu:
	RETURN      0
; end of _buttonMenu
