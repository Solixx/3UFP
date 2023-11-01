#include "glm.h"

void displayMe(void)
{
    glClear(GL_COLOR_BUFFER_BIT);

    glColor3f(1.0, 0.0, 0.0);

    glBegin(GL_POLYGON);
        glVertex3f(0.0, 0.0, 0.0);
        glVertex3f(0.7, 0.0, 0.0);
        glVertex3f(0.7, 0.7, 0.0);
        glVertex3f(0.0, 0.7, 0.0);
    glEnd();
    glFlush();
}

int main(int argc, char** argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE);
    glutInitWindowSize(1000, 300);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("Hello world");
    glClearColor(0.5, 0.5, 1.0, 1.0);
    glutDisplayFunc(displayMe);
    glutMainLoop();
    return 0;
}