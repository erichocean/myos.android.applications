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
    CircleView *circleView = [[[CircleView alloc] initWithFrame:CGRectMake((screenBounds.size.width - kCircleSize) / 2, (screenBounds.size.height - kCircleSize) / 2.0, kCircleSize, kCircleSize)] autorelease];
    [self.window addSubview:circleView];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    DLog();
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark - Delegates
/*
- (void)addSolidView:(NSTimer *)timer
{
    CircleView *solidView = [[[CircleView alloc] initWithFrame:CGRectMake(150, 230, 100, 100)] autorelease];
    DLog(@"solidView: %@", solidView);
    //solidView.backgroundColor = [UIColor redColor];
    [self.window addSubview:solidView];
}*/

@end
