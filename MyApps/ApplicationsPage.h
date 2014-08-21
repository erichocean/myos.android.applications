/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <UIKit/UIKit-private.h>

@interface ApplicationsPage : NSObject {
@package
    int _pageNumber;
    NSArray *_applications;
    int _numberOfApplications;
    id _delegate;
}

- (id)initWithPageNumber:(int)pageNumber andApplications:(NSArray *)applications startIndex:(int)index;
- (void)rearrageApplicationsWithNextPage:(ApplicationsPage *)nextPage;

@end

@protocol ApplicationsPageDelegate <NSObject>

- (void)applicationWillMove:(UIMAApplication *)application;
- (void)applicationDidMove:(UIMAApplication *)application;

@end
