
#import <Foundation/Foundation.h>
#import <SDL/SDL.h>

@protocol IGame <NSObject>

@optional
//engine hooks
-(void)initGame;
-(void)preUpdate;
-(void)postUpdate;
-(void)preRender;
-(void)postRender;
-(void)shutdown;

//sdl event handling
-(void)handleSDLEvent:(const SDL_Event *)event;

@required
//basics of the game loop
-(void)update:(long)dt;
-(void)render:(float)i withSurface:(SDL_Surface *)surface;

@end
