
#import "Demo.h"
#import <SDL/SDL.h>
#import <SDL/SDL_opengl.h>

@implementation Demo

-(void)update:(long)dt
{

}

-(void)render:(float)i withSurface:(SDL_Surface *)surface
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
 
    glBegin(GL_QUADS);
        glColor3f(1, 0, 0); glVertex3f(0, 0, 0);
        glColor3f(1, 1, 0); glVertex3f(100, 0, 0);
        glColor3f(1, 0, 1); glVertex3f(100, 100, 0);
        glColor3f(1, 1, 1); glVertex3f(0, 100, 0);
    glEnd();
}

-(void)initGame
{
	NSLog(@"Initializing Game");

	glClearColor(100.0f / 255.0f, 100.0f / 255.0f, 100.0f / 255.0f, 1.0f);
	glClearDepth(1.0f);
	 
	glViewport(0, 0, 1024, 768);
	 
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	 
	glOrtho(0, 1024, 768, 0, 1, -1);
	 
	glMatrixMode(GL_MODELVIEW);
	 
	glEnable(GL_TEXTURE_2D);
	 
	glLoadIdentity();
}

-(void)shutdown
{
	NSLog(@"Shutting Down");	
}

@end

