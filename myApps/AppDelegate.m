/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "AppDelegate.h"
#import "FileManager.h"

@implementation AppDelegate

@synthesize window=_window;

#pragma mark - Life cycle

- (void)dealloc
{
    //DLog();
    [_window release];
    [_launcherVC release];
    [super dealloc];
}

#pragma mark - Delegates

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    FileManagerSetupDirectories();
    //DLog();
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    //_launcherVC = [[LauncherVC alloc] init];
    _loadingScreenVC = [[LoadingScreenVC alloc] init];
    
    [_window addSubview:_loadingScreenVC.view];
    [_window makeKeyAndVisible];
    
    //DLog(@"self: %@", self);
    [self performSelector:@selector(loadViews) withObject:nil afterDelay:0.01];
    //DLog();
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //DLog();
    [_launcherVC gotoHomepage];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //DLog();
}

#pragma mark - Helpers

- (void)loadViews
{
    _launcherVC = [[LauncherVC alloc] init];
    [_window addSubview:_launcherVC.view];
    [_loadingScreenVC.view removeFromSuperview];
    [_loadingScreenVC release];
    _loadingScreenVC = nil;
    UIMLApplicationLauncherViewDidAdded();
    //DLog();
    //DLog(@"self: %@", self);
}

@end
