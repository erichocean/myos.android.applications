/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "CalculatorAppDelegate.h"
#import "CalcFace.h"

@implementation CalculatorAppDelegate

@synthesize window;

#pragma mark - Life cycle

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    DLog(@"mainScreen: %@", [UIScreen mainScreen]);
    self.window = [[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].applicationFrame] autorelease];
    window.backgroundColor = [UIColor yellowColor];
    window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    CalcFace * calcFace = [[CalcFace alloc] initWithFrame:window.bounds];
    calcFace.backgroundColor = [UIColor grayColor];
    [window addSubview:calcFace];
    [calcFace release];
    [window makeKeyAndVisible];
}

- (void)dealloc
{
    [window release];
    [super dealloc];
}

@end

