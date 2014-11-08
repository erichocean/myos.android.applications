/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "AppDelegate.h"
#import "CircleView.h"

@implementation AppDelegate

@synthesize window=_window;

#pragma mark - Life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //DLog();
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    //DLog(@"window: %@", window);
    self.window.backgroundColor = [UIColor brownColor];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CircleView *circleView = [[[CircleView alloc] initWithFrame:CGRectMake(0, 40, kCircleSize, kCircleSize)] autorelease];
    
    [self.window addSubview:circleView];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark - Delegates

@end
