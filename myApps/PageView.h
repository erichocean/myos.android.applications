/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "ApplicationsPage.h"

@interface PageView : UIView {
@package
    NSArray *_icons;
    ApplicationsPage *_applicationsPage;
}

- (id)initWithFrame:(CGRect)theFrame andApplicationsPage:(ApplicationsPage *)applicationsPage;

@end

void PageViewLoadIcons(PageView *pageView);
