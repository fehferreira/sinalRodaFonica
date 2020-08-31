
_controle_menu:

;controller.c,31 :: 		char controle_menu(char var_atual)
;controller.c,33 :: 		if(flagVoltar == 0)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_controle_menu0
;controller.c,35 :: 		vetor_menu[pos_menu] = var_atual;
	MOVLW       _vetor_menu+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_vetor_menu+0)
	MOVWF       FSR1H 
	MOVF        _pos_menu+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        FARG_controle_menu_var_atual+0, 0 
	MOVWF       POSTINC1+0 
;controller.c,36 :: 		pos_menu++;
	INCF        _pos_menu+0, 1 
;controller.c,37 :: 		var_atual = 1;
	MOVLW       1
	MOVWF       FARG_controle_menu_var_atual+0 
;controller.c,38 :: 		}else if(pos_menu > 0)
	GOTO        L_controle_menu1
L_controle_menu0:
	MOVF        _pos_menu+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_controle_menu2
;controller.c,40 :: 		pos_menu--;
	DECF        _pos_menu+0, 1 
;controller.c,41 :: 		var_atual = vetor_menu[pos_menu];
	MOVLW       _vetor_menu+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_vetor_menu+0)
	MOVWF       FSR0H 
	MOVF        _pos_menu+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
;controller.c,42 :: 		}
L_controle_menu2:
L_controle_menu1:
;controller.c,44 :: 		return var_atual;
	MOVF        FARG_controle_menu_var_atual+0, 0 
	MOVWF       R0 
;controller.c,45 :: 		}
L_end_controle_menu:
	RETURN      0
; end of _controle_menu

_desligaSinais:

;controller.c,51 :: 		void desligaSinais()
;controller.c,53 :: 		TMR1ON_bit = 0x00;
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;controller.c,54 :: 		TMR3ON_bit = 0x00;
	BCF         TMR3ON_bit+0, BitPos(TMR3ON_bit+0) 
;controller.c,55 :: 		rotacao = 0x00;
	BCF         LATD5_bit+0, BitPos(LATD5_bit+0) 
;controller.c,56 :: 		fase = 0x00;
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;controller.c,57 :: 		}
L_end_desligaSinais:
	RETURN      0
; end of _desligaSinais

_logicaMenuPrincipal:

;controller.c,62 :: 		void logicaMenuPrincipal()
;controller.c,65 :: 		max_menu = 2;
	MOVLW       2
	MOVWF       _max_menu+0 
;controller.c,66 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;controller.c,69 :: 		configInterruptTMR1();
	CALL        _configInterruptTMR1+0, 0
;controller.c,71 :: 		while(flagConfirma != 1)
L_logicaMenuPrincipal3:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenuPrincipal4
;controller.c,73 :: 		tipoSinal();
	CALL        _tipoSinal+0, 0
;controller.c,74 :: 		}
	GOTO        L_logicaMenuPrincipal3
L_logicaMenuPrincipal4:
;controller.c,75 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller.c,76 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;controller.c,77 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenuPrincipal5
;controller.c,84 :: 		}
L_logicaMenuPrincipal6:
;controller.c,85 :: 		}
L_logicaMenuPrincipal5:
;controller.c,86 :: 		flagVoltar = 0x00;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller.c,87 :: 		}
L_end_logicaMenuPrincipal:
	RETURN      0
; end of _logicaMenuPrincipal

_logicaMenu1:

;controller.c,91 :: 		void logicaMenu1()
;controller.c,94 :: 		max_menu = 1;
	MOVLW       1
	MOVWF       _max_menu+0 
;controller.c,95 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;controller.c,97 :: 		while(flagVoltar != 1)
L_logicaMenu18:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu19
;controller.c,99 :: 		while(flagConfirma != 1)
L_logicaMenu110:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenu111
;controller.c,104 :: 		}
L_logicaMenu112:
;controller.c,105 :: 		}
	GOTO        L_logicaMenu110
L_logicaMenu111:
;controller.c,106 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller.c,107 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;controller.c,108 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu114
;controller.c,113 :: 		}
L_logicaMenu115:
;controller.c,114 :: 		}
L_logicaMenu114:
;controller.c,115 :: 		}
	GOTO        L_logicaMenu18
L_logicaMenu19:
;controller.c,116 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller.c,117 :: 		}
L_end_logicaMenu1:
	RETURN      0
; end of _logicaMenu1

_logicaMenu2:

;controller.c,121 :: 		void logicaMenu2()
;controller.c,124 :: 		max_menu = 2;
	MOVLW       2
	MOVWF       _max_menu+0 
;controller.c,125 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;controller.c,127 :: 		while(flagVoltar != 1)
L_logicaMenu217:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu218
;controller.c,129 :: 		while(flagConfirma != 1)
L_logicaMenu219:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenu220
;controller.c,135 :: 		}
L_logicaMenu221:
;controller.c,136 :: 		}
	GOTO        L_logicaMenu219
L_logicaMenu220:
;controller.c,137 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller.c,138 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;controller.c,139 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu223
;controller.c,144 :: 		}
L_logicaMenu223:
;controller.c,145 :: 		}
	GOTO        L_logicaMenu217
L_logicaMenu218:
;controller.c,146 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller.c,147 :: 		}
L_end_logicaMenu2:
	RETURN      0
; end of _logicaMenu2

_logicaMenu3:

;controller.c,151 :: 		void logicaMenu3()
;controller.c,154 :: 		max_menu = 2;
	MOVLW       2
	MOVWF       _max_menu+0 
;controller.c,155 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;controller.c,157 :: 		while(flagVoltar != 1)
L_logicaMenu324:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu325
;controller.c,159 :: 		while(flagConfirma != 1)
L_logicaMenu326:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenu327
;controller.c,165 :: 		}
L_logicaMenu328:
;controller.c,166 :: 		}
	GOTO        L_logicaMenu326
L_logicaMenu327:
;controller.c,167 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller.c,168 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;controller.c,169 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu330
;controller.c,174 :: 		}
L_logicaMenu330:
;controller.c,175 :: 		}
	GOTO        L_logicaMenu324
L_logicaMenu325:
;controller.c,176 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller.c,177 :: 		}
L_end_logicaMenu3:
	RETURN      0
; end of _logicaMenu3

_logicaMenu1_1:

;controller.c,182 :: 		void logicaMenu1_1()
;controller.c,185 :: 		max_menu = 2;
	MOVLW       2
	MOVWF       _max_menu+0 
;controller.c,186 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;controller.c,189 :: 		configInterruptTMR1();
	CALL        _configInterruptTMR1+0, 0
;controller.c,192 :: 		TMR1ON_bit = 0x01;
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;controller.c,193 :: 		TMR3ON_bit = 0x01;
	BSF         TMR3ON_bit+0, BitPos(TMR3ON_bit+0) 
;controller.c,195 :: 		while(flagVoltar != 1)
L_logicaMenu1_131:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu1_132
;controller.c,197 :: 		while(flagConfirma != 1)
L_logicaMenu1_133:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenu1_134
;controller.c,203 :: 		}
L_logicaMenu1_135:
;controller.c,204 :: 		}
	GOTO        L_logicaMenu1_133
L_logicaMenu1_134:
;controller.c,205 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller.c,206 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;controller.c,207 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu1_137
;controller.c,213 :: 		}
L_logicaMenu1_138:
;controller.c,214 :: 		}
L_logicaMenu1_137:
;controller.c,215 :: 		}
	GOTO        L_logicaMenu1_131
L_logicaMenu1_132:
;controller.c,216 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller.c,217 :: 		desligaSinais();
	CALL        _desligaSinais+0, 0
;controller.c,218 :: 		}
L_end_logicaMenu1_1:
	RETURN      0
; end of _logicaMenu1_1
