
_main:

;sinal_rotacao_60_2.c,77 :: 		void main()
;sinal_rotacao_60_2.c,81 :: 		GIE_bit = 0x01;                          //Habilita interrupçoes gerais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;sinal_rotacao_60_2.c,82 :: 		PEIE_bit = 0x01;                         //Habilita interrupçoes de perifericos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;sinal_rotacao_60_2.c,83 :: 		IPEN_bit = 0x01;                         //Habilita prioridade de interrupção.
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;sinal_rotacao_60_2.c,84 :: 		TRISD = 0x1F;                            //Configura PORTD com i/o's
	MOVLW       31
	MOVWF       TRISD+0 
;sinal_rotacao_60_2.c,85 :: 		TRISB = 0xF0;                            //Configura PORTB com i/o's
	MOVLW       240
	MOVWF       TRISB+0 
;sinal_rotacao_60_2.c,86 :: 		TRISC = 0xFF;
	MOVLW       255
	MOVWF       TRISC+0 
;sinal_rotacao_60_2.c,88 :: 		view = 1;
	BSF         _view+0, BitPos(_view+0) 
;sinal_rotacao_60_2.c,89 :: 		contT = 60000;
	MOVLW       96
	MOVWF       _contT+0 
	MOVLW       234
	MOVWF       _contT+1 
;sinal_rotacao_60_2.c,93 :: 		T1CON = 0b01000001;                      //Configuraçao TIMER1
	MOVLW       65
	MOVWF       T1CON+0 
;sinal_rotacao_60_2.c,98 :: 		TMR1L = 0x00;                            //Inicializa variaveis de contagem
	CLRF        TMR1L+0 
;sinal_rotacao_60_2.c,99 :: 		TMR1H = 0x00;                            //Inicializa variaveis de contagem
	CLRF        TMR1H+0 
;sinal_rotacao_60_2.c,100 :: 		TMR1IE_bit = 0x01;                       //Habilita interrupçao do TIMER1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;sinal_rotacao_60_2.c,101 :: 		TMR1IP_bit = 0x01;                       //Configura a interrupção como HighPriority
	BSF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;sinal_rotacao_60_2.c,105 :: 		T0CON = 0b10001000;                      //Configuração do TIMER0
	MOVLW       136
	MOVWF       T0CON+0 
;sinal_rotacao_60_2.c,111 :: 		TMR0H         = 0xB1;                           //Inicialização do contador TMR0H
	MOVLW       177
	MOVWF       TMR0H+0 
;sinal_rotacao_60_2.c,112 :: 		TMR0L         = 0xE0;                           //Inicialização do contador TMR0L
	MOVLW       224
	MOVWF       TMR0L+0 
;sinal_rotacao_60_2.c,113 :: 		TMR0IE_bit = 0x01;                       //Ativa a interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;sinal_rotacao_60_2.c,114 :: 		TMR0IP_bit = 0x00;                       //Configura a interrupção como HighPriotiry
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;sinal_rotacao_60_2.c,118 :: 		ADCON0 = 0x00;                           //Configurando os conversores como desabilitados
	CLRF        ADCON0+0 
;sinal_rotacao_60_2.c,119 :: 		ADCON1 = 0x0F;                           //Configurando as entradas como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;sinal_rotacao_60_2.c,124 :: 		Lcd_Init();                              //Inicializa LCD
	CALL        _Lcd_Init+0, 0
;sinal_rotacao_60_2.c,125 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                //Desliga o cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;sinal_rotacao_60_2.c,128 :: 		while(1)
L_main0:
;sinal_rotacao_60_2.c,130 :: 		if(limpa_lcd) limpaLCD();
	BTFSS       _limpa_lcd+0, BitPos(_limpa_lcd+0) 
	GOTO        L_main2
	CALL        _limpaLCD+0, 0
L_main2:
;sinal_rotacao_60_2.c,132 :: 		if(view) valorCaptura();                     //Funcao de impressao da rotaçao
	BTFSS       _view+0, BitPos(_view+0) 
	GOTO        L_main3
	CALL        _valorCaptura+0, 0
	GOTO        L_main4
L_main3:
;sinal_rotacao_60_2.c,133 :: 		else     valores();
	CALL        _valores+0, 0
L_main4:
;sinal_rotacao_60_2.c,136 :: 		}//FINAL LOOP
	GOTO        L_main0
;sinal_rotacao_60_2.c,138 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_valorCaptura:

;sinal_rotacao_60_2.c,143 :: 		void valorCaptura()
;sinal_rotacao_60_2.c,145 :: 		Lcd_Chr(1,1,'V');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       86
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;sinal_rotacao_60_2.c,146 :: 		Lcd_Chr_Cp('a');
	MOVLW       97
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,147 :: 		Lcd_Chr_Cp('r');
	MOVLW       114
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,148 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,149 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,150 :: 		Lcd_Chr_Cp('a');
	MOVLW       97
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,151 :: 		Lcd_Chr_Cp('p');
	MOVLW       112
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,152 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,153 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,155 :: 		Lcd_Chr(2,6,'m');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       109
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;sinal_rotacao_60_2.c,156 :: 		Lcd_Chr_Cp('s');
	MOVLW       115
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,158 :: 		Lcd_Chr(2,14,'H');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       72
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;sinal_rotacao_60_2.c,159 :: 		Lcd_Chr_Cp('z');
	MOVLW       122
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,161 :: 		FloatToStr_FixLen(((2*(valor_captura * 1 * 2E-7))/1000),txt2, 5);
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
;sinal_rotacao_60_2.c,162 :: 		WordToStr((1/(2*(valor_captura * 1 * 2E-7))),txt);
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
;sinal_rotacao_60_2.c,164 :: 		Lcd_Out(2,1,txt2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;sinal_rotacao_60_2.c,165 :: 		Lcd_Out(2,8,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;sinal_rotacao_60_2.c,166 :: 		}
L_end_valorCaptura:
	RETURN      0
; end of _valorCaptura

_valores:

;sinal_rotacao_60_2.c,168 :: 		void valores()
;sinal_rotacao_60_2.c,170 :: 		Lcd_Chr(1,1,'V');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       86
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;sinal_rotacao_60_2.c,171 :: 		Lcd_Chr_Cp('a');
	MOVLW       97
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,172 :: 		Lcd_Chr_Cp('r');
	MOVLW       114
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,173 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,174 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,175 :: 		Lcd_Chr_Cp('n');
	MOVLW       110
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,176 :: 		Lcd_Chr_Cp('c');
	MOVLW       99
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,177 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,178 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;sinal_rotacao_60_2.c,180 :: 		LongToStr(contT,txt2);
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
;sinal_rotacao_60_2.c,182 :: 		Lcd_Out(2,1,txt2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;sinal_rotacao_60_2.c,183 :: 		}
L_end_valores:
	RETURN      0
; end of _valores

_limpaLCD:

;sinal_rotacao_60_2.c,186 :: 		void limpaLCD()
;sinal_rotacao_60_2.c,188 :: 		limpa_lcd = 0;
	BCF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;sinal_rotacao_60_2.c,189 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;sinal_rotacao_60_2.c,190 :: 		}
L_end_limpaLCD:
	RETURN      0
; end of _limpaLCD

_interrupt:

;sinal_rotacao_60_2.c,193 :: 		void interrupt()                           //Funcao de interrupçao
;sinal_rotacao_60_2.c,195 :: 		if(TMR1IF_bit)                           //Houve interrupçao do TIMER1?
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt5
;sinal_rotacao_60_2.c,197 :: 		contador_rotacao ++;                   //incrementa sinal de rotaçao
	INCF        _contador_rotacao+0, 1 
;sinal_rotacao_60_2.c,199 :: 		if(contador_rotacao < dentes) rotacao = ~rotacao;
	MOVF        _dentes+0, 0 
	SUBWF       _contador_rotacao+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt6
	BTG         LATD5_bit+0, BitPos(LATD5_bit+0) 
L_interrupt6:
;sinal_rotacao_60_2.c,200 :: 		if(contador_rotacao >= dentes)
	MOVF        _dentes+0, 0 
	SUBWF       _contador_rotacao+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt7
;sinal_rotacao_60_2.c,202 :: 		fase = ~fase;
	BTG         LATD0_bit+0, BitPos(LATD0_bit+0) 
;sinal_rotacao_60_2.c,203 :: 		rotacao = 0x00;
	BCF         LATD5_bit+0, BitPos(LATD5_bit+0) 
;sinal_rotacao_60_2.c,204 :: 		}
L_interrupt7:
;sinal_rotacao_60_2.c,205 :: 		if(contador_rotacao == (dentes+falhas))
	MOVF        _falhas+0, 0 
	ADDWF       _dentes+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt29
	MOVF        R1, 0 
	XORWF       _contador_rotacao+0, 0 
L__interrupt29:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt8
;sinal_rotacao_60_2.c,207 :: 		contador_rotacao = 0x00;
	CLRF        _contador_rotacao+0 
;sinal_rotacao_60_2.c,208 :: 		fase = 0x00;
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;sinal_rotacao_60_2.c,209 :: 		}
L_interrupt8:
;sinal_rotacao_60_2.c,210 :: 		TMR1L = contT << 8;
	CLRF        TMR1L+0 
;sinal_rotacao_60_2.c,211 :: 		TMR1H = contT >> 8;
	MOVF        _contT+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR1H+0 
;sinal_rotacao_60_2.c,213 :: 		valor_captura = 65535 - contT;
	MOVF        _contT+0, 0 
	SUBLW       255
	MOVWF       _valor_captura+0 
	MOVF        _contT+1, 0 
	MOVWF       _valor_captura+1 
	MOVLW       255
	SUBFWB      _valor_captura+1, 1 
;sinal_rotacao_60_2.c,215 :: 		TMR1IF_bit = 0x00;                     //Limpa a flag do TIMER1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;sinal_rotacao_60_2.c,216 :: 		}
L_interrupt5:
;sinal_rotacao_60_2.c,218 :: 		}
L_end_interrupt:
L__interrupt28:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;sinal_rotacao_60_2.c,220 :: 		void interrupt_low()
;sinal_rotacao_60_2.c,222 :: 		if(TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt_low9
;sinal_rotacao_60_2.c,224 :: 		TMR0IF_bit = 0x00;                     //Limpa a flag do TMR0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;sinal_rotacao_60_2.c,225 :: 		TMR0H = 0xB1;                          //Reinicialização do contador TMR0H
	MOVLW       177
	MOVWF       TMR0H+0 
;sinal_rotacao_60_2.c,226 :: 		TMR0L = 0xE0;                          //Reinicialização do contador TMR0L
	MOVLW       224
	MOVWF       TMR0L+0 
;sinal_rotacao_60_2.c,228 :: 		testButton();
	CALL        _testButton+0, 0
;sinal_rotacao_60_2.c,230 :: 		}
L_interrupt_low9:
;sinal_rotacao_60_2.c,231 :: 		}
L_end_interrupt_low:
L__interrupt_low31:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

_testButton:

;sinal_rotacao_60_2.c,233 :: 		void testButton()
;sinal_rotacao_60_2.c,235 :: 		if(button1)
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
	GOTO        L_testButton10
;sinal_rotacao_60_2.c,237 :: 		if(contT == 65535 || contT >= 65525)  contT = 65535;
	MOVF        _contT+1, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__testButton33
	MOVLW       255
	XORWF       _contT+0, 0 
L__testButton33:
	BTFSC       STATUS+0, 2 
	GOTO        L__testButton22
	MOVLW       255
	SUBWF       _contT+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testButton34
	MOVLW       245
	SUBWF       _contT+0, 0 
L__testButton34:
	BTFSC       STATUS+0, 0 
	GOTO        L__testButton22
	GOTO        L_testButton13
L__testButton22:
	MOVLW       255
	MOVWF       _contT+0 
	MOVLW       255
	MOVWF       _contT+1 
	GOTO        L_testButton14
L_testButton13:
;sinal_rotacao_60_2.c,238 :: 		else              contT += 10;
	MOVLW       10
	ADDWF       _contT+0, 1 
	MOVLW       0
	ADDWFC      _contT+1, 1 
L_testButton14:
;sinal_rotacao_60_2.c,240 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;sinal_rotacao_60_2.c,242 :: 		}
L_testButton10:
;sinal_rotacao_60_2.c,244 :: 		if(button2)
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
	GOTO        L_testButton15
;sinal_rotacao_60_2.c,246 :: 		if(contT == 60000 || contT <= 60010)  contT = 60000;
	MOVF        _contT+1, 0 
	XORLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__testButton35
	MOVLW       96
	XORWF       _contT+0, 0 
L__testButton35:
	BTFSC       STATUS+0, 2 
	GOTO        L__testButton21
	MOVF        _contT+1, 0 
	SUBLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__testButton36
	MOVF        _contT+0, 0 
	SUBLW       106
L__testButton36:
	BTFSC       STATUS+0, 0 
	GOTO        L__testButton21
	GOTO        L_testButton18
L__testButton21:
	MOVLW       96
	MOVWF       _contT+0 
	MOVLW       234
	MOVWF       _contT+1 
	GOTO        L_testButton19
L_testButton18:
;sinal_rotacao_60_2.c,247 :: 		else            contT -= 10;
	MOVLW       10
	SUBWF       _contT+0, 1 
	MOVLW       0
	SUBWFB      _contT+1, 1 
L_testButton19:
;sinal_rotacao_60_2.c,249 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;sinal_rotacao_60_2.c,250 :: 		}
L_testButton15:
;sinal_rotacao_60_2.c,252 :: 		if(button3)
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
	GOTO        L_testButton20
;sinal_rotacao_60_2.c,254 :: 		view = ~view;
	BTG         _view+0, BitPos(_view+0) 
;sinal_rotacao_60_2.c,255 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;sinal_rotacao_60_2.c,256 :: 		}
L_testButton20:
;sinal_rotacao_60_2.c,257 :: 		}
L_end_testButton:
	RETURN      0
; end of _testButton
