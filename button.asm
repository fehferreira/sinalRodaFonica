
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
	GOTO        L__buttonFreq33
	MOVLW       255
	XORWF       _contT+0, 0 
L__buttonFreq33:
	BTFSC       STATUS+0, 2 
	GOTO        L__buttonFreq29
	MOVLW       255
	SUBWF       _contT+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonFreq34
	MOVLW       245
	SUBWF       _contT+0, 0 
L__buttonFreq34:
	BTFSC       STATUS+0, 0 
	GOTO        L__buttonFreq29
	GOTO        L_buttonFreq3
L__buttonFreq29:
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
	GOTO        L__buttonFreq35
	MOVLW       96
	XORWF       _contT+0, 0 
L__buttonFreq35:
	BTFSC       STATUS+0, 2 
	GOTO        L__buttonFreq28
	MOVF        _contT+1, 0 
	SUBLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonFreq36
	MOVF        _contT+0, 0 
	SUBLW       106
L__buttonFreq36:
	BTFSC       STATUS+0, 0 
	GOTO        L__buttonFreq28
	GOTO        L_buttonFreq8
L__buttonFreq28:
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

_buttonMenu:

;button.c,51 :: 		void buttonMenu()
;button.c,53 :: 		if(button1)                     //Botao solto?
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
	GOTO        L_buttonMenu11
;button.c,55 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu12
;button.c,57 :: 		flagVoltar = 1;
	BSF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;button.c,58 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,59 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,60 :: 		}
L_buttonMenu12:
;button.c,61 :: 		}
L_buttonMenu11:
;button.c,63 :: 		if(button2)
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
	GOTO        L_buttonMenu13
;button.c,65 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu14
;button.c,67 :: 		if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
	MOVF        _var_menu+0, 0 
	SUBWF       _max_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu17
	MOVF        _var_menu+0, 0 
	SUBWF       _min_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu17
L__buttonMenu31:
	DECF        _var_menu+0, 1 
	GOTO        L_buttonMenu18
L_buttonMenu17:
;button.c,68 :: 		else                             var_menu = min_menu;
	MOVF        _min_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu18:
;button.c,69 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,70 :: 		}
L_buttonMenu14:
;button.c,71 :: 		}
L_buttonMenu13:
;button.c,73 :: 		if(button3)
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
	GOTO        L_buttonMenu19
;button.c,75 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu20
;button.c,77 :: 		if(var_menu < max_menu && var_menu >= 0) var_menu ++;
	MOVF        _max_menu+0, 0 
	SUBWF       _var_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu23
	MOVLW       0
	SUBWF       _var_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu23
L__buttonMenu30:
	INCF        _var_menu+0, 1 
	GOTO        L_buttonMenu24
L_buttonMenu23:
;button.c,78 :: 		else                             var_menu = max_menu;
	MOVF        _max_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu24:
;button.c,79 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,80 :: 		}
L_buttonMenu20:
;button.c,81 :: 		}
L_buttonMenu19:
;button.c,83 :: 		if(button4)
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
	GOTO        L_buttonMenu25
;button.c,85 :: 		if(flaginicio == 1)
	BTFSS       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu26
;button.c,87 :: 		flaginicio = 0;
	BCF         _flaginicio+0, BitPos(_flaginicio+0) 
;button.c,88 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,89 :: 		}else
	GOTO        L_buttonMenu27
L_buttonMenu26:
;button.c,91 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,92 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,93 :: 		}
L_buttonMenu27:
;button.c,94 :: 		}
L_buttonMenu25:
;button.c,95 :: 		}
L_end_buttonMenu:
	RETURN      0
; end of _buttonMenu
