/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "AppDelegate.h"
#import "RectangleView.h"

@implementation AppDelegate

@synthesize window=_window;

#pragma mark - Life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //DLog();
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    //DLog(@"window: %@", window);
    self.window.backgroundColor = [UIColor whiteColor];
    //DLog(@"self.window.backgroundColor: %@", self.window.backgroundColor);
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    RectangleView *rectangleView = [[[RectangleView alloc] initWithFrame:CGRectMake((screenBounds.size.width - kRectangleWidth) / 2, (screenBounds.size.height - kRectangleHeight) / 2.0, kRectangleWidth, kRectangleHeight)] autorelease];
    [self.window addSubview:rectangleView];
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
