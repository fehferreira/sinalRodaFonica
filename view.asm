
_inicioLcd:

;view.c,31 :: 		void inicioLcd()
;view.c,33 :: 		Lcd_Chr(1,1,'V');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       86
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,34 :: 		Lcd_Chr_Cp('a');
	MOVLW       97
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,35 :: 		Lcd_Chr_Cp('r');
	MOVLW       114
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,36 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,37 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,38 :: 		Lcd_Chr_Cp('a');
	MOVLW       97
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,39 :: 		Lcd_Chr_Cp('p');
	MOVLW       112
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,40 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,41 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,43 :: 		}
L_end_inicioLcd:
	RETURN      0
; end of _inicioLcd

_valorCaptura:

;view.c,47 :: 		void valorCaptura()
;view.c,49 :: 		Lcd_Chr(1,1,'V');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       86
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,50 :: 		Lcd_Chr_Cp('a');
	MOVLW       97
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,51 :: 		Lcd_Chr_Cp('r');
	MOVLW       114
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,52 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,53 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,54 :: 		Lcd_Chr_Cp('a');
	MOVLW       97
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,55 :: 		Lcd_Chr_Cp('p');
	MOVLW       112
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,56 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,57 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,59 :: 		Lcd_Chr(2,6,'m');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       109
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,60 :: 		Lcd_Chr_Cp('s');
	MOVLW       115
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,62 :: 		Lcd_Chr(2,14,'H');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       72
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,63 :: 		Lcd_Chr_Cp('z');
	MOVLW       122
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,65 :: 		FloatToStr_FixLen(((2*(valor_captura * 1 * 2E-7))/1000),txt2, 5);
	MOVF        _valor_captura+0, 0 
	MOVWF       R0 
	MOVF        _valor_captura+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       149
	MOVWF       R4 
	MOVLW       191
	MOVWF       R5 
	MOVLW       86
	MOVWF       R6 
	MOVLW       104
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+3 
	MOVLW       _txt2+0
	MOVWF       FARG_FloatToStr_FixLen_str+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_FloatToStr_FixLen_str+1 
	MOVLW       5
	MOVWF       FARG_FloatToStr_FixLen_len+0 
	CALL        _FloatToStr_FixLen+0, 0
;view.c,66 :: 		WordToStr((1/(2*(valor_captura * 1 * 2E-7))),txt);
	MOVF        _valor_captura+0, 0 
	MOVWF       R0 
	MOVF        _valor_captura+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       149
	MOVWF       R4 
	MOVLW       191
	MOVWF       R5 
	MOVLW       86
	MOVWF       R6 
	MOVLW       104
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;view.c,68 :: 		Lcd_Out(2,1,txt2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;view.c,69 :: 		Lcd_Out(2,8,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;view.c,70 :: 		}
L_end_valorCaptura:
	RETURN      0
; end of _valorCaptura

_valores:

;view.c,74 :: 		void valores()
;view.c,76 :: 		Lcd_Chr(1,1,'V');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       86
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,77 :: 		Lcd_Chr_Cp('a');
	MOVLW       97
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,78 :: 		Lcd_Chr_Cp('r');
	MOVLW       114
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,79 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,80 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,81 :: 		Lcd_Chr_Cp('n');
	MOVLW       110
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,82 :: 		Lcd_Chr_Cp('c');
	MOVLW       99
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,83 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,84 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,86 :: 		LongToStr(contT,txt2);
	MOVF        _contT+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        _contT+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVLW       0
	MOVWF       FARG_LongToStr_input+2 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _txt2+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;view.c,88 :: 		Lcd_Out(2,1,txt2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;view.c,89 :: 		}
L_end_valores:
	RETURN      0
; end of _valores

_limpaLCD:

;view.c,93 :: 		void limpaLCD()
;view.c,95 :: 		limpa_lcd = 0;
	BCF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;view.c,96 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;view.c,97 :: 		}
L_end_limpaLCD:
	RETURN      0
; end of _limpaLCD
