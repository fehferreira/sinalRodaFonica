//-----------------------------------------------------------------------------
/*
  GERADORDE SINAL DE ROTA�AO 60-2 COM FASE - PROJETO
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:NOVEMBRO 2019
  CLOCK: 4MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- DEFININDO INCLUDE'S

#include "header.h"

//---------------------------------------------------------------------------
// --- CRIA�AO DE VARIAVEIS GLOBAIS

bit view,
    limpa_lcd;
    
char txt[15],
     txt2[15];

//-----------------------------------------------------------------------------
// --- INCLUINDO PROT�TIPOS DAS FUN��ES

void buttonFreq();
void testButtonVar();

//-----------------------------------------------------------------------------
// --- DESENVOLVIMENTO DAS FUN��ES

void valorCaptura()
{
  Lcd_Chr(1,1,'V');
  Lcd_Chr_Cp('a');
  Lcd_Chr_Cp('r');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp('a');
  Lcd_Chr_Cp('p');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp(':');

  Lcd_Chr(2,6,'m');
  Lcd_Chr_Cp('s');

  Lcd_Chr(2,14,'H');
  Lcd_Chr_Cp('z');

  FloatToStr_FixLen(((2*(valor_captura * 1 * 2E-7))/1000),txt2, 5);
  WordToStr((1/(2*(valor_captura * 1 * 2E-7))),txt);

  Lcd_Out(2,1,txt2);
  Lcd_Out(2,8,txt);
}

//----------------------------------------------------------------------------

void valores()
{
  Lcd_Chr(1,1,'V');
  Lcd_Chr_Cp('a');
  Lcd_Chr_Cp('r');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('n');
  Lcd_Chr_Cp('c');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp(':');

  LongToStr(contT,txt2);

  Lcd_Out(2,1,txt2);
}

//----------------------------------------------------------------------------

void limpaLCD()
{
  limpa_lcd = 0;
  Lcd_Cmd(_LCD_CLEAR);
}

//----------------------------------------------------------------------------

