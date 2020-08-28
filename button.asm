
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
	GOTO        L__buttonFreq27
	MOVLW       255
	XORWF       _contT+0, 0 
L__buttonFreq27:
	BTFSC       STATUS+0, 2 
	GOTO        L__buttonFreq23
	MOVLW       255
	SUBWF       _contT+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonFreq28
	MOVLW       245
	SUBWF       _contT+0, 0 
L__buttonFreq28:
	BTFSC       STATUS+0, 0 
	GOTO        L__buttonFreq23
	GOTO        L_buttonFreq3
L__buttonFreq23:
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
	GOTO        L__buttonFreq29
	MOVLW       96
	XORWF       _contT+0, 0 
L__buttonFreq29:
	BTFSC       STATUS+0, 2 
	GOTO        L__buttonFreq22
	MOVF        _contT+1, 0 
	SUBLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonFreq30
	MOVF        _contT+0, 0 
	SUBLW       106
L__buttonFreq30:
	BTFSC       STATUS+0, 0 
	GOTO        L__buttonFreq22
	GOTO        L_buttonFreq8
L__buttonFreq22:
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
;button.c,45 :: 		view = ~view;
	BTG         _view+0, BitPos(_view+0) 
;button.c,46 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,47 :: 		}
L_buttonFreq10:
;button.c,48 :: 		}
L_end_buttonFreq:
	RETURN      0
; end of _buttonFreq

_testButtonVar:

;button.c,52 :: 		void testButtonVar()
;button.c,54 :: 		if(button1)
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
;button.c,56 :: 		if(contT == 65535 || contT >= 65525)  contT = 65535;
	MOVF        _contT+1, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__testButtonVar32
	MOVLW       255
	XORWF       _contT+0, 0 
L__testButtonVar32:
	BTFSC       STATUS+0, 2 
	GOTO        L__testButtonVar25
	MOVLW       255
	SUBWF       _contT+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testButtonVar33
	MOVLW       245
	SUBWF       _contT+0, 0 
L__testButtonVar33:
	BTFSC       STATUS+0, 0 
	GOTO        L__testButtonVar25
	GOTO        L_testButtonVar14
L__testButtonVar25:
	MOVLW       255
	MOVWF       _contT+0 
	MOVLW       255
	MOVWF       _contT+1 
	GOTO        L_testButtonVar15
L_testButtonVar14:
;button.c,57 :: 		else              contT += 10;
	MOVLW       10
	ADDWF       _contT+0, 1 
	MOVLW       0
	ADDWFC      _contT+1, 1 
L_testButtonVar15:
;button.c,58 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,59 :: 		}
L_testButtonVar11:
;button.c,61 :: 		if(button2)
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
;button.c,63 :: 		if(contT == 60000 || contT <= 60010)  contT = 60000;
	MOVF        _contT+1, 0 
	XORLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__testButtonVar34
	MOVLW       96
	XORWF       _contT+0, 0 
L__testButtonVar34:
	BTFSC       STATUS+0, 2 
	GOTO        L__testButtonVar24
	MOVF        _contT+1, 0 
	SUBLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__testButtonVar35
	MOVF        _contT+0, 0 
	SUBLW       106
L__testButtonVar35:
	BTFSC       STATUS+0, 0 
	GOTO        L__testButtonVar24
	GOTO        L_testButtonVar19
L__testButtonVar24:
	MOVLW       96
	MOVWF       _contT+0 
	MOVLW       234
	MOVWF       _contT+1 
	GOTO        L_testButtonVar20
L_testButtonVar19:
;button.c,64 :: 		else            contT -= 10;
	MOVLW       10
	SUBWF       _contT+0, 1 
	MOVLW       0
	SUBWFB      _contT+1, 1 
L_testButtonVar20:
;button.c,65 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,66 :: 		}
L_testButtonVar16:
;button.c,68 :: 		if(button3)
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
;button.c,70 :: 		view = ~view;
	BTG         _view+0, BitPos(_view+0) 
;button.c,71 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,72 :: 		}
L_testButtonVar21:
;button.c,73 :: 		}
L_end_testButtonVar:
	RETURN      0
; end of _testButtonVar
