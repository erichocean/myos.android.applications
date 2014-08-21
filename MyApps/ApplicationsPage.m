/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <UIKit/UIKit-private.h>
#import "ApplicationsPage.h"

@implementation ApplicationsPage

#pragma mark - Life cycle

- (id)initWithPageNumber:(int)pageNumber andApplications:(NSArray *)applications startIndex:(int)index
{
    if ((self=[super init])) {
        //DLog();
        _pageNumber = pageNumber;
        _numberOfApplications = 0;
        //DLog();
        _applications = [[NSArray alloc] initWithObjects:
                         [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                         [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                         [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                         [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                         [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                         [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                         nil];
        //DLog();
        for (int i=index; i<applications.count; i++) {
            UIMAApplication *application = [applications objectAtIndex:i];
            int appPageNumber = application.pageNumber;
            //DLog(@"i: %d", i);
            //DLog(@"_pageNumber: %d", _pageNumber);
            if (appPageNumber == _pageNumber) {
                _numberOfApplications++;
                //DLog(@"[_applications objectAtIndex:application.yLocation]: %@", [_applications objectAtIndex:application.yLocation]);
                //DLog(@"application.yLocation: %d, application.xLocation: %d", application.yLocation, application.xLocation);
                [[_applications objectAtIndex:application.yLocation] replaceObjectAtIndex:application.xLocation withObject:application];
                //[application addObserver:self forKeyPath:@"running" options:NSKeyValueObservingOptionPrior context:nil];
                //DLog(@"[_applications objectAtIndex:application.yLocation] 2: %@", [_applications objectAtIndex:application.yLocation]);
            } else {
                break;
            }
        }
    }
    return self;
}

- (void)dealloc
{
    [_applications release];
    [super dealloc];
}

#pragma mark - Data

- (UIMAApplication *)maximumScoredApplication
{
    UIMAApplication *maxApp = nil;
    for (NSArray *row in _applications) {
        for (UIMAApplication *application in row) {
            if (application != [NSNull null]) {
                if (!maxApp) {
                    maxApp = application;
                } else if (maxApp->_score < application->_score && !application.anchored) {
                    maxApp = application;
                }
            }
        }
    }
    return maxApp;
}

- (UIMAApplication *)manimumScoredApplication
{
    UIMAApplication *minApp = nil;
    for (NSArray *row in _applications) {
        for (UIMAApplication *application in row) {
            if (application != [NSNull null]) {
                if (!minApp) {
                    minApp = application;
                } else if (minApp->_score > application->_score && !application.anchored) {
                    minApp = application;
                }
            }
        }
    }
    return minApp;
}

#pragma mark - Delegates
/*
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //DLog();
    NSNumber *isPrior = [change objectForKey:@"notificationIsPrior"];
    if (![isPrior boolValue]) {
        return;
    }
    //DLog(@"keyPath: %@", keyPath);
    //DLog(@"object: %@", object);
    UIMAApplication *application = (UIMAApplication *)object;
    UIMAApplicationIcon *icon = application->_applicationIcon;
    //DLog(@"icon : %@", icon);
    icon->_iconLabel.textColor = [UIColor orangeColor];
}*/

#pragma mark - Misc

- (void)rearrageApplicationsWithNextPage:(ApplicationsPage *)nextPage
{ 
    UIMAApplication *myMinApp = [self maximumScoredApplication];
    UIMAApplication *nextPageMaxApp = [nextPage maximumScoredApplication];
    if (nextPageMaxApp->_score > myMinApp->_score) {
        [_delegate applicationWillMove:myMinApp];
        [nextPage->_delegate applicationWillMove:nextPageMaxApp];
        
        [myMinApp swapLocationWithApp:nextPageMaxApp];
        
        [nextPageMaxApp retain];
        [[_applications objectAtIndex:myMinApp.yLocation] replaceObjectAtIndex:myMinApp.xLocation  withObject:myMinApp];
        [[_applications objectAtIndex:nextPageMaxApp.yLocation] replaceObjectAtIndex:nextPageMaxApp.xLocation  withObject:nextPageMaxApp];
        [nextPageMaxApp release];
        
        [_delegate applicationDidMove:myMinApp];
        [nextPage->_delegate applicationDidMove:nextPageMaxApp];
    }
}

@end
