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
    
    //DLog(@"solidView: %@", solidView);
    //solidView.backgroundColor = [UIColor redColor];
    [self.window addSubview:rectangleView];
    
    //[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(addSolidView:) userInfo:nil repeats:NO];
    [self.window makeKeyAndVisible];
    //DLog();
//    RectangleView* solidView2 = [[[RectangleView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)] autorelease];
//    [solidView addSubview:solidView2];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark - Delegates

@end
