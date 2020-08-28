
_interruptTMR0:

;interruptTMR0.c,22 :: 		void interruptTMR0()
;interruptTMR0.c,24 :: 		if(TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interruptTMR00
;interruptTMR0.c,26 :: 		TMR0IF_bit = 0x00;                     //Limpa a flag do TMR0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;interruptTMR0.c,27 :: 		TMR0H = 0xB1;                          //Reinicialização do contador TMR0H
	MOVLW       177
	MOVWF       TMR0H+0 
;interruptTMR0.c,28 :: 		TMR0L = 0xE0;                          //Reinicialização do contador TMR0L
	MOVLW       224
	MOVWF       TMR0L+0 
;interruptTMR0.c,30 :: 		if(TMR1ON_bit == 0) testButtonVar();
	BTFSC       TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
	GOTO        L_interruptTMR01
	CALL        _testButtonVar+0, 0
	GOTO        L_interruptTMR02
L_interruptTMR01:
;interruptTMR0.c,31 :: 		else                buttonFreq();
	CALL        _buttonFreq+0, 0
L_interruptTMR02:
;interruptTMR0.c,32 :: 		}
L_interruptTMR00:
;interruptTMR0.c,33 :: 		}
L_end_interruptTMR0:
	RETURN      0
; end of _interruptTMR0

_configInterruptTMR0:

;interruptTMR0.c,37 :: 		void configInterruptTMR0()
;interruptTMR0.c,41 :: 		T0CON = 0b10001000;                      //Configuração do TIMER0
	MOVLW       136
	MOVWF       T0CON+0 
;interruptTMR0.c,47 :: 		TMR0H         = 0xB1;                           //Inicialização do contador TMR0H
	MOVLW       177
	MOVWF       TMR0H+0 
;interruptTMR0.c,48 :: 		TMR0L         = 0xE0;                           //Inicialização do contador TMR0L
	MOVLW       224
	MOVWF       TMR0L+0 
;interruptTMR0.c,49 :: 		TMR0IE_bit = 0x01;                       //Ativa a interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;interruptTMR0.c,50 :: 		TMR0IP_bit = 0x00;                       //Configura a interrupção como HighPriotiry
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;interruptTMR0.c,51 :: 		}
L_end_configInterruptTMR0:
	RETURN      0
; end of _configInterruptTMR0
