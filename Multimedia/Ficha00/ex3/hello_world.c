#include <GL/glut.h>
#include <stdio.h>

#define MAX_SIZE 100

int num1;
char buffer[50];
float arr[MAX_SIZE];

void display() {
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1.0, 1.0, 1.0);

    //verifica se num1 é primo e escreve no glut primo se for e não primo se não for
    int i, j, primo = 1;
    for (i = 2; i < num1; i++) {
        if (num1 % i == 0) {
            primo = 0;
            break;
        }
    }
    if (primo == 1) {
        sprintf(buffer, "O numero %d  primo", num1);
    } else {
        sprintf(buffer, "O numero %d nao e primo", num1);
    }

    glRasterPos2f(-0.5, 0.5);
    for (j = 0; buffer[j] != '\0'; j++) {
        glutBitmapCharacter(GLUT_BITMAP_TIMES_ROMAN_24, buffer[j]);
    }

    glFlush();
}

void keyboard(unsigned char key, int x, int y) {
    if (key == 27) { // Tecla Esc para sair
        exit(0);
    }
}

void specialKeys(int key, int x, int y) {
    if (key == GLUT_KEY_F1) {
        glutPostRedisplay();
    }
}

int main(int argc, char** argv) {
    printf("Digite um número: ");
    scanf("%d", &num1);

    glutInit(&argc, argv);
    glutInitWindowSize(400, 300);
    glutCreateWindow("Soma e Maior Número");
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glutDisplayFunc(display);
    glutKeyboardFunc(keyboard);
    glutSpecialFunc(specialKeys);
    glutMainLoop();

    return 0;
}
