/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <UIKit/UIKit.h>
#import "LoadingScreenVC.h"
#import "LauncherVC.h"

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *_window;
    LoadingScreenVC *_loadingScreenVC;
    LauncherVC *_launcherVC;
}

@property (nonatomic, retain) UIWindow *window;

@end
