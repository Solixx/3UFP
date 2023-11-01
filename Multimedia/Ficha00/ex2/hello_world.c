#include <GL/glut.h>
#include <stdio.h>

#define MAX_SIZE 100

float num1;
char buffer[50];
float arr[MAX_SIZE];

void display() {
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1.0, 1.0, 1.0);

    //order arr in ascending order
    for(int i = 0; i < num1; i++){
        for(int j = i + 1; j < num1; j++){
            if(arr[i] > arr[j]){
                float temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }

    // Exibe os valores de arr dos números
    for (int i = 0; i < num1; i++) {
        sprintf(buffer, "%.2f", arr[i]);
        glRasterPos2f(-0.8, 0.8 - i * 0.2);
        for (int i = 0; buffer[i] != '\0'; i++) {
            glutBitmapCharacter(GLUT_BITMAP_9_BY_15, buffer[i]);
        }
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
    scanf("%f", &num1);

    for(int i = 0; i < num1; i++){
        printf("Digite um número: ");
        scanf("%f", &arr[i]);
    }

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
