
#import "Kobjc.h"
#import <SDL/SDL.h>
#import <SDL/SDL_opengl.h>

@implementation Kobjc

+(int)initWithGame:(id<IGame>)game
{

	if(!game) {
		NSLog(@"Game must not be null.");
		return 1;
	}

	//init sdl
	if ( SDL_Init(SDL_INIT_EVERYTHING) < 0 ) {
		printf("Unable to initialize SDL: %s\n", SDL_GetError());
		return 1;
	}
	 
	SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 ); 

	//show window
	SDL_Surface* surface = SDL_SetVideoMode( 640, 480, 16, SDL_OPENGL ); 

	if ([game respondsToSelector:@selector(initGame)]) {
		[game initGame];
	}

	SDL_Event event;
	BOOL running = true;
	BOOL respondsToPreUpdate = [game respondsToSelector:@selector(preUpdate)];
	BOOL respondsToPostUpdate = [game respondsToSelector:@selector(postUpdate)];
	BOOL respondsToPreRender = [game respondsToSelector:@selector(preRender)];
	BOOL respondsToPostRender = [game respondsToSelector:@selector(postRender)];

	while(running) {
		while(SDL_PollEvent(&event)) {
			switch(event.type) {
				case SDL_QUIT:
				running = false;
				break;
			}
		}

		if (respondsToPreUpdate) [game preUpdate];
		[game update:-1];
		if (respondsToPostUpdate) [game postUpdate];

		if (respondsToPreRender) [game preRender];
		[game render:-1 withSurface:surface];
		if (respondsToPostRender) [game postRender];

		SDL_Delay(1);
	}

	if ([game respondsToSelector:@selector(shutdown)]) {
		[game shutdown];
	}

	// Free the SDL_Surface only if it was successfully created
	if ( surface ) { 
		SDL_FreeSurface( surface );
	}

	//shutdown sdl
	SDL_Quit();

	return 0;
}

@end
