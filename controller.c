//-----------------------------------------------------------------------------
/*
  GERADORDE SINAL DE ROTAÇAO 60-2 COM FASE - PROJETO
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:NOVEMBRO 2019
  CLOCK: 4MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- DEFININDO INCLUDE'S

#include "header.h"

//----------------------------------------------------------------------------
// ---- DECLARAï¿½ï¿½O DE VARIAVEIS -----

bit flagConfirma,
    flagVoltar,
    flaginicio;

unsigned short var_menu = 1,
               pos_menu,
               max_menu,
               min_menu,
               vetor_menu[5];

unsigned int counter_rotacao;

//----------------------------------------------------------------------------
// --- FUNÇAO DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

char controle_menu(char var_atual)
{
  if(flagVoltar == 0)
  {
    vetor_menu[pos_menu] = var_atual;
    pos_menu++;
    var_atual = 1;
  }else if(pos_menu > 0)
  {
    pos_menu--;
    var_atual = vetor_menu[pos_menu];
  }

  return var_atual;
}


//----------------------------------------------------------------------------
// --- FUNÇÃO DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

void desligaSinais()
{
  TMR1ON_bit = 0x00;
  TMR3ON_bit = 0x00;
  rotacao = 0x00;
  fase = 0x00;
}

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNï¿½OES LOGICAS DOS MENUS E SUBMENUS -----

void logicaMenuPrincipal()
{
  //Definindo a quantidade de menu
  max_menu = 2;
  min_menu = 1;
  
  //Configurar TIMER1 para sinal de rotacao
  configInterruptTMR1();

  while(flagConfirma != 1)
  {
    tipoSinal();
  }
  flagConfirma = 0;
  var_menu = controle_menu(var_menu);
  if(flagVoltar != 1)
  {
    switch(vetor_menu[pos_menu-1])
    {
      /*case 1: logicaMenu1();break;
      case 2: logicaMenu2();break;
      case 3: logicaMenu3();break;*/
    }
  }
  flagVoltar = 0x00;
}

//----------------------------------------------------------------------------

void logicaMenu1()
{
  //Definindo a quantidade de menu
  max_menu = 1;
  min_menu = 1;

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      switch(var_menu)
      {
        /*case 1: sub_menu1_1();break;*/
      }
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      switch(vetor_menu[pos_menu-1])
      {
        /*case 1: logicaMenu1_1();break;*/
      }
    }
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

void logicaMenu2()
{
  //Definindo a quantidade de menu
  max_menu = 2;
  min_menu = 1;

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      switch(var_menu)
      {
        /*case 1: sub_menu2_1();break;
        case 2: sub_menu2_2();break;*/
      }
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      //switch(vetor_menu[pos_menu])
      //{
      //}
    }
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

void logicaMenu3()
{
  //Definindo a quantidade de menu
  max_menu = 2;
  min_menu = 1;

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      switch(var_menu)
      {
        /*case 1: sub_menu3_1();break;
        case 2: sub_menu3_2();break;*/
      }
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      //switch(vetor_menu[pos_menu])
      //{
      //}
    }
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------
// --- DECLARAï¿½AO DAS FUNï¿½OES LOGICAS DOS SUBMENUS ----

void logicaMenu1_1()
{
  //Definindo a quantidade de menu
  max_menu = 2;
  min_menu = 1;

  //Definindo as configs de Rotacao
  configInterruptTMR1();

  //Ligando os TIMERS para os sinais
  TMR1ON_bit = 0x01;
  TMR3ON_bit = 0x01;

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      switch(var_menu)
      {
        /*case 1: sinal_rotacao(counter_rotacao);break;
        case 2: sinal_velocidade(counter_velocidade);break;*/
      }
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      switch(vetor_menu[pos_menu-1])
      {
        /*case 1: logicaEditarRotacao();break;
        case 2: logicaEditarVelocidade();break;*/
      }
    }
  }
  flagVoltar = 0;
  desligaSinais();
}

//----------------------------------------------------------------------------