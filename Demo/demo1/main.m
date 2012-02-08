#import <Foundation/Foundation.h>
#import <KobjcEngine/Kobjc.h>
#import "Demo.h"

int main(int argc, char **argv) {

    Demo *demo = [[Demo alloc] init];
    
    return [Kobjc runGame:demo];
}
