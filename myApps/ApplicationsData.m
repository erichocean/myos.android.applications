/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <UIKit/UIKit-private.h>
#import "ApplicationsData.h"
#import "ApplicationsPage.h"
#import "FileManager.h"

static ApplicationsData *_applicationsData = nil;
static NSString *const _kMAPageNumber = @"pageNumber";
 
@implementation ApplicationsData

@synthesize applications=_applications;
@synthesize applicationsPages=_applicationsPages;

#pragma mark - Life cycle

+ (void)initialize
{
    _applicationsData = [[ApplicationsData alloc] init];
}

- (id)init
{
    if ((self=[super init])) {
        _applications = FileManagerInstantiateApps();
        //DLog();
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"pageNumber" ascending:YES];
        //DLog(@"_applications: %@", _applications);
        self.applications = [_applications sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
        //DLog(@"_applications: %@", _applications);
        UIMAApplication *lastApplicatyion = [_applications lastObject];
        int lastPageNumber = lastApplicatyion.pageNumber;
        int numberOfPages = lastPageNumber + 1;
        //DLog(@"numberOfPages: %d", numberOfPages);
        
        _applicationsPages = [[NSMutableArray alloc] initWithCapacity:10];
        int startIndex = 0;
        for (int i=0; i<numberOfPages; i++) {
            //DLog(@"i: %d", i);
            ApplicationsPage *applicationsPage = [[ApplicationsPage alloc] initWithPageNumber:i
                                                                              andApplications:_applications
                                                                                   startIndex:startIndex];
            startIndex += applicationsPage->_numberOfApplications;
            //DLog();
            [_applicationsPages addObject:applicationsPage];
            [applicationsPage release];
        }
        //DLog(@"_applicationsPages: %@", _applicationsPages);
    }
    return self;
}

#pragma mark - Class methods

+ (ApplicationsData *)sharedData
{
    return _applicationsData;
}

#pragma mark - Delegates

#pragma mark - Misc

- (void)rearrageApplications
{
    for (int i=0; i<_applicationsPages.count-1; i++) {
        ApplicationsPage *applicationsPage = [_applicationsPages objectAtIndex:i];
        ApplicationsPage *nextApplicationsPage = [_applicationsPages objectAtIndex:i+1];
        [applicationsPage rearrageApplicationsWithNextPage:nextApplicationsPage];
    }
}

@end
