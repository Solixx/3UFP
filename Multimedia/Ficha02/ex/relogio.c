#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#if defined(__APPLE__) || defined(MACOSX)
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

/**************************************
************* CONSTANTE PI ************
**************************************/

#ifndef M_PI
#define M_PI 3.1415926535897932384626433832795
#endif

/**************************************
* AUXILIARES CONVERSÃO GRAUS-RADIANOS *
**************************************/

#define rtd(x) (180 * (x) / M_PI)
#define dtr(x) (M_PI * (x) / 180)

#define DEBUG 1

/**************************************
********** VARIÁVEIS GLOBAIS **********
**************************************/

typedef struct
{
  GLboolean doubleBuffer;
  GLint delay;
} Estado;

typedef struct
{
  GLint hor, min, seg;
} Horas;

typedef struct
{
  GLint numLados;
  GLfloat raio;
  GLfloat tamLado;
  Horas hora;
} Modelo;

Estado estado;
Modelo modelo;



/**************************************
************** FUNÇÕES ****************
**************************************/

void poligono(GLint n, GLfloat x0, GLfloat y0, GLfloat r){
  glColor3f(1.0f, 1.0f, 1.0f);
  GLfloat aDim = 360/n;
  GLfloat angulo = 45;
  GLfloat x, y;

  glBegin(GL_POLYGON);
    for (int i = 0; i < n; i++)
    {
      GLfloat radianos = (angulo*3.14f/180);
      x = x0 + r * cos(radianos);
      y = y0 + r * sin(radianos);
      glVertex2f(x, y);
      angulo += aDim;
    }
  glEnd();
  
}

void mostrador(GLfloat r){
  glColor3f(0.0f, 0.0f, 0.0f);
  
  GLfloat aDim = 360/60;
  GLfloat angulo = 0;
  GLfloat x, y, x2, y2;
  glLineWidth(1.0);

    for (int i = 0; i < 60; i++)
    {
      GLfloat comprimento = (i%5 == 0) ? 0.05 : 0.02;
      GLfloat radianos = (angulo*3.14f/180);
      x = r * cos(radianos);
      y = r * sin(radianos);
      x2 = (r - comprimento) * cos(radianos);
      y2 = (r - comprimento) * sin(radianos);
      glBegin(GL_LINES);
        glVertex2f(x, y);
        glVertex2f(x2, y2);
      glEnd();
      angulo += aDim;
    }
}

void ponteiros(GLfloat x0, GLfloat y0){
  GLfloat segundo = 90.0 - (modelo.hora.seg - 6) * 6;  // 360 graus divididos por 60 segundos
  GLfloat minuto = 90.0 - (modelo.hora.min + (modelo.hora.seg - 6) / 60.0) * 6;  // 360 graus divididos por 60 minutos
  GLfloat hora = 90.0 - (modelo.hora.hor % 12 + modelo.hora.min / 60.0) * 30;  // 360 graus divididos por 12 horas

  glBegin(GL_LINES);
      glColor3f(0.0f, 0.0f, 1.0f);
      glVertex2f(x0, y0);
      glVertex2f((x0 + 0.6) * cos(segundo * 3.14f / 180), (y0 + 0.6) * sin(segundo * 3.14f / 180));
    glEnd();
  glBegin(GL_LINES);
      glColor3f(0.0f, 1.0f, 0.0f);
      glVertex2f(x0, y0);
      glVertex2f((x0 + 0.4) * cos(minuto * 3.14f / 180), (y0 + 0.4) * sin(minuto * 3.14f / 180));
  glEnd();
  glBegin(GL_LINES);
      glColor3f(1.0f, 0.0f, 0.0f);
      glVertex2f(x0, y0);
      glVertex2f((x0 + 0.2) * cos(hora * 3.14f / 180), (y0 + 0.2) * sin(hora * 3.14f / 180));
  glEnd();

  
}

/**************************************
*** INICIALIZAÇÃO DO AMBIENTE OPENGL **
**************************************/

void init(void)
{

  struct tm *current_time;
  time_t timer = time(0);

  /* Delay para o timer */
  estado.delay = 1000;

  modelo.tamLado = 1;
  modelo.numLados = 60;
  modelo.raio = 0.75;

  /* Ler hora do Sistema */
  current_time = localtime(&timer);
  modelo.hora.hor = current_time->tm_hour;
  modelo.hora.min = current_time->tm_min;
  modelo.hora.seg = current_time->tm_sec;

  glClearColor(0.0, 0.0, 0.0, 0.0);

  glEnable(GL_POINT_SMOOTH);
  glEnable(GL_LINE_SMOOTH);
  glEnable(GL_POLYGON_SMOOTH);
}

/**************************************
***** CALL BACKS DE JANELA/DESENHO ****
**************************************/

/* Callback para redimensionar janela */
void reshape(int width, int height)
{
  GLint size;

  if (width < height)
    size = width;
  else
    size = height;

  /* glViewport(botom, left, width, height)
     Define parte da janela a ser utilizada pelo OpenGL */
  glViewport(0, 0, (GLint)size, (GLint)size);

  /* Matriz Projeção
     Matriz onde se define como o mundo e apresentado na janela */
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();

  /* gluOrtho(left,right,bottom,top,near,far);
     Projeção ortogonal 3D, com profundidade (Z) entre -1 e 1 */
  glOrtho(-1.0, 1.0, -1.0, 1.0, 1.0, -1.0);

  /* Matriz Modelview
     Matriz onde são realizadas as tranformações dos modelos desenhados */
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
}


/**************************************
** ESPAÇO PARA DEFINIÇÃO DAS ROTINAS **
****** AUXILIARES DE DESENHO ... ******
**************************************/


/* Callback de desenho */
void draw(void)
{
  glClear(GL_COLOR_BUFFER_BIT);
  
  /* Espaço para chamada das rotinas auxiliares de desenho ... */

  poligono(modelo.numLados,0,0,modelo.raio);
  mostrador(modelo.raio);
  ponteiros(0,0);

  /*y
  glBegin(GL_POLYGON);
    glColor3f(1.0f, 0.0f, 0.0f);
    glVertex2f(modelo.tamLado / 2, modelo.tamLado / 2);
    glColor3f(0.0f, 0.0f, 1.0f);
    glVertex2f(-modelo.tamLado / 2, modelo.tamLado / 2);
    glColor3f(0.0f, 1.0f, 0.0f);
    glVertex2f(-modelo.tamLado / 2, -modelo.tamLado / 2);
    glColor3f(1.0f, 0.0f, 1.0f);
    glVertex2f(modelo.tamLado / 2, -modelo.tamLado / 2);
  glEnd();
  */

  glFlush();

  if (estado.doubleBuffer)
    glutSwapBuffers();
}


/**************************************
******** CALLBACKS TIME/IDLE **********
**************************************/

/* Callback Idle */
void idle(void)
{
  /* Ações a tomar quando o GLUT está idle */

  /* Redesenhar o ecrã */
  glutPostRedisplay();
}

/* Callback de temporizador */
void timer(int value)
{
  glutTimerFunc(estado.delay, timer, 0);
  /* Acções do temporizador ...
     Não colocar aqui primitivas OpenGL de desenho glBegin, glEnd, etc.
     Simplesmente alterar os valores de modelo.hora.hor, modelo.hora.min e modelo.hora.seg */
     /* Ler hora do Sistema */
     struct tm *current_time;
      time_t timer = time(0);

      /* Ler hora do Sistema */
      current_time = localtime(&timer);
      modelo.hora.hor = current_time->tm_hour;
      modelo.hora.min = current_time->tm_min;
      modelo.hora.seg = current_time->tm_sec;

  /* Redesenhar o ecrã (invoca o callback de desenho) */
  glutPostRedisplay();
}

/**************************************
*********** FUNÇÃO AJUDA **************
**************************************/

void imprime_ajuda(void)
{
  printf("\n\nDesenho de um quadrado\n");
  printf("h,H - Ajuda \n");
  printf("+   - Aumentar tamanho do Lado\n");
  printf("-   - Diminuir tamanho do Lado\n");
  printf("ESC - Sair\n");
}

/**************************************
********* CALLBACKS TECLADO ***********
**************************************/

/* Callback para interação via teclado (carregar na tecla) */
void key(unsigned char key, int x, int y)
{
  switch (key)
  {
  case 27: // Tecla Escape
    exit(1);
    /* Ações sobre outras teclas */

  case 'h':
  case 'H':
    imprime_ajuda();
    break;

  case '+':
    if (modelo.tamLado < 1.8)
    {
      modelo.tamLado += 0.05;
      glutPostRedisplay(); 
    }
    break;
  case '-':
    if (modelo.tamLado > 0.2)
    {
      modelo.tamLado -= 0.05;
      glutPostRedisplay(); 
    }
    break;
  }

  if (DEBUG)
    printf("Carregou na tecla %c\n", key);
}

/* Callback para interação via teclado (largar a tecla) */
void keyUp(unsigned char key, int x, int y)
{
  if (DEBUG)
    printf("Largou a tecla %c\n", key);
}

/* Callback para interacção via teclas especiais (carregar na tecla) */
void specialKey(int key, int x, int y)
{
  /* Ações sobre outras teclas especiais
      GLUT_KEY_F1 ... GLUT_KEY_F12
      GLUT_KEY_UP
      GLUT_KEY_DOWN
      GLUT_KEY_LEFT
      GLUT_KEY_RIGHT
      GLUT_KEY_PAGE_UP
      GLUT_KEY_PAGE_DOWN
      GLUT_KEY_HOME
      GLUT_KEY_END
      GLUT_KEY_INSERT */

  switch (key)
  {
  case GLUT_KEY_UP:
    estado.delay *= 2;
    break;
  case GLUT_KEY_DOWN:
    estado.delay /= 2;
    break;
    
    /* Redesenhar o ecrã */
    glutPostRedisplay();
  }

  if (DEBUG)
    printf("Carregou na tecla especial %d\n", key);
}

/* Callback para interação via teclas especiais (largar a tecla) */
void specialKeyUp(int key, int x, int y)
{

  if (DEBUG)
    printf("Largou a tecla especial %d\n", key);
}

/**************************************
************ FUNÇÃO MAIN **************
**************************************/

int main(int argc, char **argv)
{
  estado.doubleBuffer = GL_FALSE; // Colocar GL_TRUE para ligar o Double Buffer

  glutInit(&argc, argv);
  glutInitWindowPosition(0, 0);
  glutInitWindowSize(300, 300);
  glutInitDisplayMode(((estado.doubleBuffer) ? GLUT_DOUBLE : GLUT_SINGLE) | GLUT_RGB);
  if (glutCreateWindow("Exemplo") == GL_FALSE)
    exit(1);

  init();

  imprime_ajuda();

  /* Registar callbacks do GLUT */

  /* callbacks de janelas/desenho */
  glutReshapeFunc(reshape);
  glutDisplayFunc(draw);

  /* Callbacks de teclado */
  glutKeyboardFunc(key);
  //glutKeyboardUpFunc(keyUp);
  glutSpecialFunc(specialKey);
  glutSpecialUpFunc(specialKeyUp);

  /* Callbacks timer/idle */
  glutTimerFunc(estado.delay, timer, 0);
  glutIdleFunc(idle);

  /* Começar loop */
  glutMainLoop();

  return 0;
}
