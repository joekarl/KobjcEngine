
#import <Foundation/Foundation.h>

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
-(void)render:(float)i;

@end
