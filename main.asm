
_main:

;main.c,25 :: 		void main()
;main.c,29 :: 		GIE_bit = 0x01;                          //Habilita interrupçoes gerais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;main.c,30 :: 		PEIE_bit = 0x01;                         //Habilita interrupçoes de perifericos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;main.c,31 :: 		IPEN_bit = 0x01;                         //Habilita prioridade de interrupção.
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;main.c,32 :: 		TRISD = 0x1F;                            //Configura PORTD com i/o's
	MOVLW       31
	MOVWF       TRISD+0 
;main.c,33 :: 		TRISB = 0xF0;                            //Configura PORTB com i/o's
	MOVLW       240
	MOVWF       TRISB+0 
;main.c,34 :: 		TRISC = 0xFF;                            //Configura PORTC com i/o's
	MOVLW       255
	MOVWF       TRISC+0 
;main.c,36 :: 		flaginicio = 1;
	BSF         _flaginicio+0, BitPos(_flaginicio+0) 
;main.c,37 :: 		contT = 60000;
	MOVLW       96
	MOVWF       _contT+0 
	MOVLW       234
	MOVWF       _contT+1 
;main.c,41 :: 		ADCON0 = 0x00;                           //Configurando os conversores como desabilitados
	CLRF        ADCON0+0 
;main.c,42 :: 		ADCON1 = 0x0F;                           //Configurando as entradas como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;main.c,46 :: 		configInterruptTMR0();                   //Chamando funçao de config do TMR0
	CALL        _configInterruptTMR0+0, 0
;main.c,50 :: 		Lcd_Init();                              //Inicializa LCD
	CALL        _Lcd_Init+0, 0
;main.c,51 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                //Desliga o cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,54 :: 		while(1)
L_main0:
;main.c,56 :: 		if(limpa_lcd) limpaLCD();
	BTFSS       _limpa_lcd+0, BitPos(_limpa_lcd+0) 
	GOTO        L_main2
	CALL        _limpaLCD+0, 0
L_main2:
;main.c,57 :: 		if(flaginicio) inicioLcd();
	BTFSS       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_main3
	CALL        _inicioLcd+0, 0
	GOTO        L_main4
L_main3:
;main.c,58 :: 		else           logicaMenuPrincipal();
	CALL        _logicaMenuPrincipal+0, 0
L_main4:
;main.c,61 :: 		}//FINAL LOOP
	GOTO        L_main0
;main.c,63 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;main.c,68 :: 		void interrupt()
;main.c,70 :: 		interruptTMR1();
	CALL        _interruptTMR1+0, 0
;main.c,71 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;main.c,75 :: 		void interrupt_low()
;main.c,77 :: 		interruptTMR0();
	CALL        _interruptTMR0+0, 0
;main.c,78 :: 		}
L_end_interrupt_low:
L__interrupt_low9:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low
