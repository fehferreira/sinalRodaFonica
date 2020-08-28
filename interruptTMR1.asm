
_interruptTMR1:

;interruptTMR1.c,22 :: 		void interruptTMR1()
;interruptTMR1.c,24 :: 		if(TMR1IF_bit)                           //Houve interrupçao do TIMER1?
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interruptTMR10
;interruptTMR1.c,26 :: 		contador_rotacao ++;                   //incrementa sinal de rotaçao
	INCF        _contador_rotacao+0, 1 
;interruptTMR1.c,28 :: 		if(contador_rotacao < dentes) rotacao = ~rotacao;
	MOVF        _dentes+0, 0 
	SUBWF       _contador_rotacao+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interruptTMR11
	BTG         LATD5_bit+0, BitPos(LATD5_bit+0) 
L_interruptTMR11:
;interruptTMR1.c,29 :: 		if(contador_rotacao >= dentes)
	MOVF        _dentes+0, 0 
	SUBWF       _contador_rotacao+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interruptTMR12
;interruptTMR1.c,31 :: 		fase = ~fase;
	BTG         LATD0_bit+0, BitPos(LATD0_bit+0) 
;interruptTMR1.c,32 :: 		rotacao = 0x00;
	BCF         LATD5_bit+0, BitPos(LATD5_bit+0) 
;interruptTMR1.c,33 :: 		}
L_interruptTMR12:
;interruptTMR1.c,34 :: 		if(contador_rotacao == (dentes+falhas))
	MOVF        _falhas+0, 0 
	ADDWF       _dentes+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interruptTMR15
	MOVF        R1, 0 
	XORWF       _contador_rotacao+0, 0 
L__interruptTMR15:
	BTFSS       STATUS+0, 2 
	GOTO        L_interruptTMR13
;interruptTMR1.c,36 :: 		contador_rotacao = 0x00;
	CLRF        _contador_rotacao+0 
;interruptTMR1.c,37 :: 		fase = 0x00;
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;interruptTMR1.c,38 :: 		}
L_interruptTMR13:
;interruptTMR1.c,39 :: 		TMR1L = contT << 8;
	CLRF        TMR1L+0 
;interruptTMR1.c,40 :: 		TMR1H = contT >> 8;
	MOVF        _contT+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR1H+0 
;interruptTMR1.c,42 :: 		valor_captura = 65535 - contT;
	MOVF        _contT+0, 0 
	SUBLW       255
	MOVWF       _valor_captura+0 
	MOVF        _contT+1, 0 
	MOVWF       _valor_captura+1 
	MOVLW       255
	SUBFWB      _valor_captura+1, 1 
;interruptTMR1.c,44 :: 		TMR1IF_bit = 0x00;                     //Limpa a flag do TIMER1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;interruptTMR1.c,45 :: 		}
L_interruptTMR10:
;interruptTMR1.c,46 :: 		}
L_end_interruptTMR1:
	RETURN      0
; end of _interruptTMR1

_configInterruptTMR1:

;interruptTMR1.c,50 :: 		void configInterruptTMR1()
;interruptTMR1.c,54 :: 		T1CON = 0b01000001;                      //Configuraçao TIMER1
	MOVLW       65
	MOVWF       T1CON+0 
;interruptTMR1.c,59 :: 		TMR1L = 0x00;                            //Inicializa variaveis de contagem
	CLRF        TMR1L+0 
;interruptTMR1.c,60 :: 		TMR1H = 0x00;                            //Inicializa variaveis de contagem
	CLRF        TMR1H+0 
;interruptTMR1.c,61 :: 		TMR1IE_bit = 0x01;                       //Habilita interrupçao do TIMER1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;interruptTMR1.c,62 :: 		TMR1IP_bit = 0x01;                       //Configura a interrupção como HighPriority
	BSF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;interruptTMR1.c,63 :: 		}
L_end_configInterruptTMR1:
	RETURN      0
; end of _configInterruptTMR1
