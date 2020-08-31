//-----------------------------------------------------------------------------
/*
  GERALDOR DE SINAL DE ROTAÇÃO GENÉRICO
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: AGOSTO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS

  -----------------------------------------------------------
        --- CALCULO PARA INTERRUPÇÃO DO TIMER1 ---

  Timer1_Ovf = (65536 - <TMR1H:TMR1L>) * prescaler T1 * ciclo de maquina
  Timer1_Ovf = (65536 - <variavel>) * 1 * 2E-7

  -----------------------------------------------------------
  -- CALCULO PARA INTERRUPÇÃO DO TIMER0(Teste dos botoes) ---

  Timer0_Ovf = (65535- (TMR0H + TMR0L)) * prescaler T1 * ciclo de maquina
  Timer0_Ovf = (65535 - 45536) * 2 * 2E-7
  Timer0_ovf = 0,004 segundos ou 4ms

*/
//-----------------------------------------------------------------------------
// --- DEFININDO LCD

sbit LCD_RS at RD6_bit;
sbit LCD_EN at RD7_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISD6_bit;
sbit LCD_EN_Direction at TRISD7_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

//-----------------------------------------------------------------------------
// --- MAPEAMENTO DE HARDWARE ---

#define rotacao LATD5_bit
#define fase    LATD0_bit
#define button1 Button(&PORTB, 7, 150, 1)
#define button2 Button(&PORTB, 6, 150, 1)
#define button3 Button(&PORTB, 5, 150, 1)
#define button4 Button(&PORTB, 4, 150, 1)

//-----------------------------------------------------------------------------
// --- CRIANDO PROTÓTIPOS DAS FUNÇOES

// --- LÓGICA DOS MENUS E CONTROLE DE EXIBICAO ---

void logicaMenuPrincipal();

// --- CONTROLE DOS BOTOES ---
void buttonFreq();
void buttonMenu();

// --- ARQUIVO DE CONTROLE DE FUNCOES DE EXIBICAO (LCD) ---
void inicioLcd();
void tipoSinal();
void valorCaptura();
void valores();
void limpaLCD();

// --- INTERRUPCAO DO TIMER0 (TESTE DE BOTÕES) ---
void interruptTMR0();
void configInterruptTMR0();

// --- INTERRUPCAO DO TIMER1 (SINAL DE ROTACAO) ---
void interruptTMR1();
void configInterruptTMR1();

//---------------------------------------------------------------------------
// --- CRIAÇAO DE VARIAVEIS GLOBAIS

extern unsigned short contador_rotacao,
                      dentes,
                      var_menu,
                      pos_menu,
                      max_menu,
                      min_menu,
                      falhas;

extern bit flaginicio,
           flagConfirma,
           flagVoltar,
           limpa_lcd;

extern unsigned int contT,
                    valor_captura;

extern char txt[15],
       txt2[15];