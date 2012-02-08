
#import "Kobjc.h"
#import <SDL/SDL.h>
#import <SDL/SDL_opengl.h>

@implementation Kobjc

+(int)runGame:(id<IGame>)game
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

	//init hook
	if ([game respondsToSelector:@selector(initGame)]) {
		[game initGame];
	}

	SDL_Event event;
	BOOL running = true;
	//cache whether or not the game responds to the following engine hooks
	BOOL respondsToPreUpdate = [game respondsToSelector:@selector(preUpdate)];
	BOOL respondsToPostUpdate = [game respondsToSelector:@selector(postUpdate)];
	BOOL respondsToPreRender = [game respondsToSelector:@selector(preRender)];
	BOOL respondsToPostRender = [game respondsToSelector:@selector(postRender)];
	BOOL respondsToSDLEventUpdate = [game respondsToSelector:@selector(handleSDLEvent:)];

	const int UPDATES_PER_SECOND = 30;
	const int MS_PER_UPDATE = 1000 / UPDATES_PER_SECOND;  //fixed update rate
	const int MAX_FRAMESKIP = 10; //maximum skips frame skips per update
	Uint32 nextUpdate = SDL_GetTicks();
	int skipLoops;
	float interpolation;

	while(running) {
		skipLoops = 0;

		while(SDL_PollEvent(&event)) {
			switch(event.type) {
				case SDL_QUIT:
				running = false;
				break;
			}
			if (respondsToSDLEventUpdate) {
				[game handleSDLEvent:&event];
			}
		}


		while(SDL_GetTicks() > nextUpdate && skipLoops < MAX_FRAMESKIP)
		{
			//update hooks
			if (respondsToPreUpdate) [game preUpdate];
			[game update:MS_PER_UPDATE];
			if (respondsToPostUpdate) [game postUpdate];
			nextUpdate += MS_PER_UPDATE;
			skipLoops++;
		}

		interpolation = (float)(SDL_GetTicks() + MS_PER_UPDATE - nextUpdate) / (float)( MS_PER_UPDATE );

		//render hooks
		if (respondsToPreRender) [game preRender];
		[game render:interpolation withSurface:surface];
		if (respondsToPostRender) [game postRender];

		SDL_Delay(1);
	}

	//shutdown hook
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
