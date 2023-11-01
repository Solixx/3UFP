#include <GL/glut.h>
#include <stdio.h>

float num1, num2, result;
char buffer[50];

void display() {
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1.0, 1.0, 1.0);

    // Exibe a soma dos números
    sprintf(buffer, "Soma: %.2f", result);
    glRasterPos2f(-0.8, 0.2);
    for (int i = 0; buffer[i] != '\0'; i++) {
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15, buffer[i]);
    }

    // Exibe o maior número
    if (num1 > num2) {
        sprintf(buffer, "Maior: %.2f", num1);
    } else {
        sprintf(buffer, "Maior: %.2f", num2);
    }
    glRasterPos2f(-0.8, 0.0);
    for (int i = 0; buffer[i] != '\0'; i++) {
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15, buffer[i]);
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
        result = num1 + num2;
        glutPostRedisplay();
    }
}

int main(int argc, char** argv) {
    printf("Digite o primeiro número: ");
    scanf("%f", &num1);

    printf("Digite o segundo número: ");
    scanf("%f", &num2);

    result = num1 + num2;

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
