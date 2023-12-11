

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#if defined(__APPLE__) || defined(MACOSX)
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

// materias globais
GLfloat mat_r[] = {1.0, 0.0, 0.0, 1.0};
GLfloat mat_g[] = {0.0, 1.0, 0.0, 1.0};
GLfloat mat_b[] = {0.0, 0.0, 1.0, 1.0};
GLfloat mat_w[] = {1.0, 1.0, 1.0, 1.0};

struct Modelo_s
{
	float eyex, eyey, eyez;
	GLboolean anima;
	int anima_sleep;
	GLfloat angCubo1;
	GLfloat angCubo2;
	GLfloat angLuz;

	int tipo_luz; // 0 - fixa; 1 - movel; 2 - ponto de vista
	float light_pos[4];
	float rot_luz[3];
} modelo;

void escreve(char texto[], GLfloat x, GLfloat y, GLfloat orient, GLfloat largura, GLfloat altura, GLint modo)
{
	GLint i, n, comprimento = 0;

	n = strlen(texto);
	for (i = 0; i < n; i++)
		comprimento += glutStrokeWidth(GLUT_STROKE_ROMAN, texto[i]);
	glPushMatrix();
		glTranslatef(x, y, 0.0);
		glRotatef(orient, 0.0, 0.0, 1.0);
		glScalef(largura, altura, 1.0);
		if (modo == 0)		// alinha 'a esquerda
			;				// nada a fazer
		else if (modo == 1) // alinha ao centro
			glTranslatef(-(GLfloat)comprimento / 2.0, 0.0, 0.0);
		else // alinha 'a direita
			glTranslatef(-(GLfloat)comprimento, 0.0, 0.0);
		for (i = 0; i < n; i++)
		{
			glutStrokeCharacter(GLUT_STROKE_ROMAN, texto[i]);
		}
	glPopMatrix();
}

void drawString(GLfloat x, GLfloat y, GLfloat z, GLfloat scale, char *msg)
{
	glPushMatrix();
		glTranslatef(x, y, z);
		glScalef(scale, scale, scale);
		for (int i = 0; i < strlen(msg); i++)
			glutStrokeCharacter(GLUT_STROKE_ROMAN, msg[i]);
	glPopMatrix();
}

void drawAxis()
{
#define AXIS_LIMIT 3

	glDisable(GL_LIGHTING);

	glPushAttrib(GL_LINE_BIT);
	glLineWidth(2.0);
	glBegin(GL_LINES);
	// XX
	glColor4fv(mat_r);
	glNormal3f(0.0, 0.0, 1.0);
	glVertex3f(-AXIS_LIMIT, 0, 0);
	glVertex3f(+AXIS_LIMIT, 0, 0);

	// YY
	glColor4fv(mat_g);
	glNormal3f(0.0, 0.0, 1.0);
	glVertex3f(0, -AXIS_LIMIT, 0);
	glVertex3f(0, +AXIS_LIMIT, 0);

	// ZZ
	glColor4fv(mat_b);
	glNormal3f(0.0, 0.0, 1.0);
	glVertex3f(0, 0, -AXIS_LIMIT);
	glVertex3f(0, 0, +AXIS_LIMIT);
	glEnd();
	glPopAttrib();

	//axis' names
	glColor4fv(mat_w);
	drawString(+AXIS_LIMIT, 0, 0, 0.002, "X");
	drawString(0, +AXIS_LIMIT, 0, 0.002, "Y");
	drawString(0, 0, +AXIS_LIMIT, 0.002, "Z");

	glEnable(GL_LIGHTING);
}

void desenhaLuz(float p[])
{
	glDisable(GL_LIGHTING);
	glPushMatrix();
		glTranslatef(p[0], p[1], p[2]);
		glMaterialfv(GL_FRONT, GL_AMBIENT_AND_DIFFUSE, mat_w);
		glutWireCube(0.10);
	glPopMatrix();
	glEnable(GL_LIGHTING);
}

void display()
{
	GLfloat mat_obj1[] = {0.6, 0.6, 0.6, 1.0};
	GLfloat mat_obj2[] = {0.0, 0.5, 1.0, 1.0};

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	// luz no ponto de vista
	if (modelo.tipo_luz == 2)
		glLightfv(GL_LIGHT0, GL_POSITION, modelo.light_pos);

	gluLookAt(modelo.eyex, modelo.eyey, modelo.eyez,
			  0.0, 0.0, 0.0,
			  0.0, 1.0, 0.0);

	// luz fixa na cena
	if (modelo.tipo_luz == 0)
	{
		glLightfv(GL_LIGHT0, GL_POSITION, modelo.light_pos);
		desenhaLuz(modelo.light_pos);
	}

	// luz movel
	if (modelo.tipo_luz == 1)
	{
		glPushMatrix();
			glRotatef(modelo.angLuz, modelo.rot_luz[0], modelo.rot_luz[1], modelo.rot_luz[2]);
			glLightfv(GL_LIGHT0, GL_POSITION, modelo.light_pos);
			desenhaLuz(modelo.light_pos);
		glPopMatrix();
	}

	// eixo global
	drawAxis();

	// desenhar modelo

	// 1� cubo a rodar sobre origem
	glPushMatrix();
		glRotatef(modelo.angCubo1, 0, 0, 1);
		glTranslatef(1, 0, 0);
		glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, mat_obj1);
		glutSolidCube(0.5);
	glPopMatrix();

	glTranslatef(1.5, 1.5, 0);

	// 2� cubo a rodar sobre ele proprio
	glPushMatrix();
		glRotatef(modelo.angCubo2, 0, 1, 0);
		glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, mat_obj2);
		glutSolidCube(0.5);
	glPopMatrix();

	// output message
	glDisable(GL_LIGHTING);
	glPushMatrix();
		glLoadIdentity();
		gluLookAt(0, 0, 5, 0, 0, 0, 0, 1, 0);

		glColor4fv(mat_w);

		char msg[1024];
		if (modelo.tipo_luz == 0)
			sprintf(msg, "Luz Fixa (%f, %f, %f)", modelo.light_pos[0], modelo.light_pos[1], modelo.light_pos[2]);
		else if (modelo.tipo_luz == 1)
			sprintf(msg, "Luz Movel (%f, %f, %f)", modelo.light_pos[0], modelo.light_pos[1], modelo.light_pos[2]);
		else
			strcpy(msg, "Luz no ponto de vista");

		drawString(-2, -2, 0, 0.001, msg);
		sprintf(msg, "Camara (%f, %f, %f)", modelo.eyex, modelo.eyey, modelo.eyez);
		drawString(-2, -1.8, 0, 0.001, msg);

	glPopMatrix();
	glEnable(GL_LIGHTING);

	//glFlush ();
	glutSwapBuffers();
}

void reshape(int w, int h)
{
	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	//glOrtho(-3.0, 3.0, -3.0, 3.0, 0.1, 20.0);
	gluPerspective(50, w / h, 0.1, 100);

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	//gluLookAt(modelo.eyex, modelo.eyey, modelo.eyez,
	//		0.0, 0.0, 0.0,
	//		0.0, 1.0, 0.0
	//		);
}

void anima(int v)
{
	glutTimerFunc(modelo.anima_sleep, anima, 0);

	if (modelo.tipo_luz == 1)
	{
		modelo.angLuz += 1;
		if (modelo.angLuz > 360)
			modelo.angLuz = 0;
	}

	if (modelo.anima)
	{
		modelo.angCubo1 += 5;
		if (modelo.angCubo1 > 360)
			modelo.angCubo1 = 0;
		modelo.angCubo2 += 5;
		if (modelo.angCubo2 > 360)
			modelo.angCubo2 = 0;
	}

	glutPostRedisplay();
}

void keyboard(unsigned char key, int x, int y)
{
	switch (key)
	{
	case 27:
		exit(0);
		break;
	case ' ':
		modelo.anima = !modelo.anima;
		break;
	case '1':
		modelo.light_pos[0] = 0;
		modelo.light_pos[1] = 3;
		modelo.light_pos[2] = 0;
		modelo.rot_luz[0] = 0;
		modelo.rot_luz[1] = 0;
		modelo.rot_luz[2] = 1;
		break;
	case '2':
		modelo.light_pos[0] = 3;
		modelo.light_pos[1] = 0;
		modelo.light_pos[2] = 0;
		modelo.rot_luz[0] = 0;
		modelo.rot_luz[1] = 0;
		modelo.rot_luz[2] = 1;
		break;
	case '3':
		modelo.light_pos[0] = 0;
		modelo.light_pos[1] = 0;
		modelo.light_pos[2] = 3;
		modelo.rot_luz[0] = 1;
		modelo.rot_luz[1] = 0;
		modelo.rot_luz[2] = 0;
		break;
	case '4':
		modelo.light_pos[0] = 0;
		modelo.light_pos[1] = 0;
		modelo.light_pos[2] = 0;
		break;

	case 'l':
	case 'L':
		modelo.tipo_luz++;
		modelo.tipo_luz %= 3;
		break;
	case 'x':
		modelo.eyex -= 0.1;
		break;
	case 'X':
		modelo.eyex += 0.1;
		break;
	case 'y':
		modelo.eyey -= 0.1;
		break;
	case 'Y':
		modelo.eyey += 0.1;
		break;
	case 'z':
		modelo.eyez -= 0.1;
		break;
	case 'Z':
		modelo.eyez += 0.1;
		break;
	case 'o':
	case 'O':
		modelo.eyex = modelo.eyey = 0;
		modelo.eyez = 5;
		break;
	case 'r':
	case 'R':
		modelo.eyex = 1.69;
		modelo.eyey = 2.9;
		modelo.eyez = 7.49;
		break;
	case 't':
	case 'T':
		modelo.eyex = 1.69;
		modelo.eyey = 2.9;
		modelo.eyez = -7.49;
		break;
	case 's':
	case 'S':
		modelo.eyez *= -1;
		break;
	}
	printf("Camera: %f, %f, %f\n", modelo.eyex, modelo.eyey, modelo.eyez);
	glutPostRedisplay();
}

void imprime_ajuda(void)
{
  printf("\n\nPosicionamento de Luzes:\n");
  printf("SPACE - Play/Stop \n");
  printf("1     - Luz no Eixo YY\n");
  printf("2     - Luz no Eixo XX\n");
  printf("3     - Luz no Eixo ZZ\n");
  printf("4     - Luz no Centro\n");
  printf("l,L   - Alternar Luz\n");
  printf("o,O   - Camera Ortogonal\n");
  printf("r,R   - Restart\n");
  printf("t,T   - Vista Traseira\n");
  printf("s,S   - Inverter Eixo ZZ\n");
  printf("x     - Decrementar Rotação Eixo XX\n");
  printf("X     - Incrementar Rotação Eixo XX\n");
  printf("y     - Decrementar Rotação Eixo YY\n");
  printf("Y     - Incrementar Rotação Eixo YY\n");
  printf("z     - Decrementar Rotação Eixo ZZ\n");
  printf("Z     - Incrementar Rotação Eixo ZZ\n");
  printf("ESC   - Sair\n");
}

void init()
{
	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	glEnable(GL_DEPTH_TEST);

	//glLightfv(GL_LIGHT0, GL_POSITION, modelo.light_pos);
	//float center[] = {0, 0, 0, 1};
	//glLightfv(GL_LIGHT0, GL_SPOT_DIRECTION, center);
	//glLightf(GL_LIGHT0, GL_SPOT_CUTOFF, 90);

	modelo.angCubo1 = modelo.angCubo2 = 0;
	modelo.anima_sleep = 100;
	modelo.anima = GL_TRUE;
	modelo.eyex = 1.69;
	modelo.eyey = 2.9;
	modelo.eyez = 7.49;
	modelo.light_pos[0] = 0;
	modelo.light_pos[1] = 3;
	modelo.light_pos[2] = 0;
	modelo.light_pos[3] = 1; // luz posicional
	modelo.rot_luz[0] = 0;
	modelo.rot_luz[1] = 0;
	modelo.rot_luz[2] = 1;
}

int main(int argc, char *argv[])
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
	glutInitWindowSize(500, 500);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("Posicionamento de Luzes");
	init();
	imprime_ajuda();
	glutKeyboardFunc(keyboard);
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutTimerFunc(modelo.anima_sleep, anima, 0);
	glutMainLoop();

	return 0;
}
