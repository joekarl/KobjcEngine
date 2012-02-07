
#import "Kobjc.h"
#import <SDL/SDL.h>
#import <SDL/SDL_opengl.h>

@implementation Kobjc

+(void)initWithGame:(id<IGame> *)game
{
	if(!game) {
		NSLog(@"Game must not be null.");
		return;
	}

	//init sdl
	if ( SDL_Init(SDL_INIT_VIDEO) != 0 ) {
		printf("Unable to initialize SDL: %s\n", SDL_GetError());
		return 1;
	}
	 
	SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 ); // *new*

	//show window
	SDL_Surface* surface = SDL_SetVideoMode( 640, 480, 16, SDL_OPENGL ); // *changed*

	SDL_Delay(2000);

	// Free the SDL_Surface only if it was successfully created
	if ( surface ) { 
		SDL_FreeSurface( surface );
	}

	//shutdown sdl
	SDL_Quit();
}

@end
