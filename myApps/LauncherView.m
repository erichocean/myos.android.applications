/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <UIKit/UIKit-private.h>
#import "PageView.h"
#import "LauncherView.h"
#import "ApplicationsData.h"

#define _kIconWidth                 80
#define _kIconHeight                92
#define _kUIPageControlHeight       20

@implementation LauncherView

#pragma mark - Life cycle

- (id)initWithFrame:(CGRect)theFrame
{
    self = [super initWithFrame:theFrame];
    if (self) {
        ApplicationsData *applicationsData = [ApplicationsData sharedData];
        int numberOfPages = applicationsData->_applicationsPages.count;
        PageView *pageView = nil;
        self.contentSize = CGSizeMake(theFrame.size.width * numberOfPages, theFrame.size.height);
        self.pagingEnabled = YES;
        for (int i=0; i<numberOfPages; i++) {
            pageView = [[PageView alloc]
                        initWithFrame:CGRectMake(self.frame.origin.x + i * self.frame.size.width, self.frame.origin.y,
                                                 self.frame.size.width, self.frame.size.height)
                        andApplicationsPage:[applicationsData->_applicationsPages objectAtIndex:i]];
            [self addSubview:pageView];
            [pageView release];
        };
        pageView.center = CGPointMake(pageView.center.x, pageView.center.y);
        //DLog();
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Actions

@end
