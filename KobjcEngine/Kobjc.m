
#import "Kobjc.h"

@implementation Kobjc

+(void)initWithGame:(id<IGame> *)game
{
    NSLog(@"I Made it Here and game is %@",game);
}

@end
