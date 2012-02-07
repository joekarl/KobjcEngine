
#import <Foundation/Foundation.h>
#import <SDL/SDL.h>

@protocol IGame

@optional
-(void)initGame;
-(void)preUpdate;
-(void)postUpdate;
-(void)preRender;
-(void)postRender;
-(void)shutdown;

@required
-(void)update:(long)dt;
-(void)render:(float)i withSurface:(SDL_Surface *)surface;

@end
