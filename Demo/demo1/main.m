#import <Foundation/Foundation.h>
#import <KobjcEngine/IGame.h>
#import <KobjcEngine/Kobjc.h>

@interface Game : NSObject <IGame>

@end

@implementation Game

-(void)update:(long)dt
{

}

-(void)render:(float)i
{

}

@end

int main(int argc, char **argv) {

    Game *game = [[Game alloc] init];
    
    [Kobjc initWithGame:game];
    
    return 0;
}
