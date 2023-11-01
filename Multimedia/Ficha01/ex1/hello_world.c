#include <GL/glut.h>
#include <stdio.h>
#include <math.h>

struct ponto
{
    float x, y;
};

void desenhar_circunferencia (){
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1.0, 1.0, 1.0);


    int n = 4;

    struct ponto p0, p1;

    p0.x = p0.y = 0.0;
    p1.x = p1.y = 0.8;

    //calcular ponto médio de p0 e p1
    struct ponto c;
    c.x = (p0.x + p1.x) / 2;
    c.y = (p0.y + p1.y) / 2;

    //calcular diametro de p0 e p1
    float diametro = sqrt(pow(p1.x - p0.x, 2) + pow(p1.y - p0.y, 2));

    //calcular raio
    float raio = diametro / 2;

    struct ponto arr[20];

    //calcular pontos da circunferencia
    float aDim = 360/n;
    float angulo = 360;

    for (int i = 0; i < n; i++) {
        float radianos = (angulo*3.14f/180);
        arr[i].x = c.x + raio * cos(radianos);
        arr[i].y = c.y + raio * sin(radianos);

        angulo -= aDim;
    }

    //desenhar circunferencia
    glBegin(GL_POLYGON);
    for (int i = 0; i < n; i++) {
        glVertex3f(arr[i].x, arr[i].y, 0.0);
    }
    glEnd();

    glFlush();
}

int main(int argc, char** argv) {
    

    glutInit(&argc, argv);
    glutInitWindowSize(800, 500);
    glutCreateWindow("Soma e Maior Número");
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glutDisplayFunc(desenhar_circunferencia);
    glutMainLoop();

    return 0;
}
