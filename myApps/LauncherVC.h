/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <UIKit/UIKit.h>

@class LauncherView;

@interface LauncherVC : UIViewController <UIScrollViewDelegate> {
@package
    UIPageControl *_pageControl;
    UIScrollView *_scrollView;
    LauncherView *_launcherView;
}

- (void)gotoHomepage;

@end
