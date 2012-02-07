#import <Foundation/Foundation.h>
#import <KobjcEngine/IGame.h>
#import <KobjcEngine/Kobjc.h>
#import <SDL/SDL.h>

@interface Game : NSObject <IGame>

@end

@implementation Game

-(void)update:(long)dt
{

}

-(void)render:(float)i withSurface:(SDL_Surface *)surface
{

}

@end

int main(int argc, char **argv) {

    Game *game = [[Game alloc] init];
    
    [Kobjc initWithGame:game];

    [game dealloc];
    
    return 0;
}
