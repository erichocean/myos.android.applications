/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <UIKit/UIKit-private.h>
#import "ApplicationsData.h"
#import "ApplicationsPage.h"
#import "FileManager.h"

#define kMaximumNumberOfPages   10
#define kNumberOfAppsPerRow     4
#define kNumberOfAppsPerPage    (kNumberOfAppsPerRow * 6)
#define kMaximumNumberOfApps    (kNumberOfAppsPerPage * kMaximumNumberOfPages)

static ApplicationsData *_applicationsData = nil;
static NSString *const _kMAPageNumber = @"pageNumber";

#pragma mark - Static functions

static int ApplicationsDataAppFlatLocation(UIMAApplication *application)
{
    return application.pageNumber * kNumberOfAppsPerPage + application.yLocation * kNumberOfAppsPerRow +  application.xLocation;;
}

static UIMAApplication *ApplicationsDataGetCloseDownAppToFlatLocation(ApplicationsData *applicationsData, int flatLocation)
{
    NSSortDescriptor *pageNumberDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"pageNumber" ascending:NO];
    NSSortDescriptor *yLocationDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"yLocation" ascending:NO];
    NSSortDescriptor *xLocationDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"xLocation" ascending:NO];
    NSMutableArray *applications = [applicationsData->_applications sortedArrayUsingDescriptors:[NSArray arrayWithObjects:pageNumberDescriptor, yLocationDescriptor, xLocationDescriptor, nil]];
    //DLog(@"pageNumber, yLocation, xLocation sorted applications: %@", applications);
    for (UIMAApplication *application in applications) {
        if (ApplicationsDataAppFlatLocation(application) <= flatLocation) {
            return application;
        }
    }
    return nil;
}

static int ApplicationsDataSetLocations(ApplicationsData *applicationsData)
{
    //DLog(@"applicationsData->_applications: %@", applicationsData->_applications);
    NSSortDescriptor *anchoredDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"anchored" ascending:NO];
    NSSortDescriptor *scoreDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:NO];
    applicationsData.applications = [applicationsData->_applications sortedArrayUsingDescriptors:[NSArray arrayWithObjects:anchoredDescriptor, scoreDescriptor, nil]];
    //DLog(@"anchored score sorted applications: %@", applicationsData->_applications);
    int allocSize = sizeof(BOOL)*kMaximumNumberOfApps;
    BOOL *filledLocations = malloc(allocSize);
    memset(filledLocations,NO,allocSize);
    int currentLocation = 0;
    int minusOneIndex = -1;
    //int i;
    int flatLocation;
    UIMAApplication *application;
    for (int i=0; i<applicationsData->_applications.count; i++) {
        application = [applicationsData->_applications objectAtIndex:i];
        //DLog(@"application: %@", application);
        if (application.anchored) {
            flatLocation = ApplicationsDataAppFlatLocation(application);
            //DLog(@"flatLocation: %d", flatLocation);
            filledLocations[flatLocation] = YES;
        } else if (application.score > -1) {
            //break;
            while (filledLocations[currentLocation]) {
                currentLocation++;
            }
            //DLog(@"currentLocation: %d", currentLocation);
            filledLocations[currentLocation] = YES;
            application.pageNumber = currentLocation / kNumberOfAppsPerPage;
            application.yLocation = (currentLocation % kNumberOfAppsPerPage) / kNumberOfAppsPerRow;
            application.xLocation = (currentLocation % kNumberOfAppsPerPage) % kNumberOfAppsPerRow;
            //DLog(@"set application: %@", application);
            currentLocation++;
        } else {
            minusOneIndex = i;
        }
    }
    free(filledLocations);
    return minusOneIndex;
}

static void ApplicationsDataAutoArrange(ApplicationsData *applicationsData)
{
    int minusOneIndex = ApplicationsDataSetLocations(applicationsData);
    //DLog(@"minusOneIndex: %d", minusOneIndex);
    /*DLog(@"applicationsData->_applications: %@", applicationsData->_applications);
    NSSortDescriptor *anchoredDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"anchored" ascending:NO];
    NSSortDescriptor *scoreDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:YES];
    NSMutableArray *applications = [applicationsData->_applications sortedArrayUsingDescriptors:[NSArray arrayWithObjects:anchoredDescriptor, scoreDescriptor, nil]];
    DLog(@"_applications: %@", _applications);
    int allocSize = sizeof(BOOL)*kMaximumNumberOfApps;
    BOOL filledLocations = malloc(allocSize);
    memset(filledLocations,NO,allocSize);
    int currentLocation = 0;
    int minusOneIndex = applications.count;
    int i;
    int flatLocation;
    UIMAApplication *application;
    for (i=0; i<applications.count; i++) {
        application = [applications objectAtIndex:i];
        DLog(@"application: %@", application);
        if (application.anchored) {
            flatLocation = ApplicationsDataAppFlatLocation(application);
            filledLocations[flatLocation] = YES;
        } else if (application.score > -1) {
            //break;
            while (filledLocations[currentLocation]) {
                currentLocation++;
            }
            filledLocations[currentLocation] = YES;
            application.pageNumber = currentLocation / kNumberOfAppsPerPage;
            application.yLocation = (currentLocation % kNumberOfAppsPerPage) / kNumberOfAppsPerRow;
            application.xLocation = (currentLocation % kNumberOfAppsPerPage) % kNumberOfAppsPerRow;
        } else {
            minusOneIndex = i;
        }
        currentLocation++;
    }*/
    if (minusOneIndex==-1) {
        return;
    }
    //DLog(@"for (i=minusOneIndex ...");
    int flatLocation = kNumberOfAppsPerPage-1;
    UIMAApplication *application = ApplicationsDataGetCloseDownAppToFlatLocation(applicationsData, flatLocation);
    int appFlatLocation = ApplicationsDataAppFlatLocation(application);
    int newAppScore;
    if (appFlatLocation < flatLocation) {
        newAppScore = application.score - 1;
    } else {
        newAppScore = application.score + 1;
    }
    //BOOL
    for (int i=minusOneIndex; i<applicationsData->_applications.count; i++) {
        application = [applicationsData->_applications objectAtIndex:i];
        if (application.score == -1) {
            //DLog(@"application: %@", application);
            application.score = newAppScore;
        } else {
            break;
        }
        //currentLocation++;
    }
    ApplicationsDataSetLocations(applicationsData);
}

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
        ApplicationsDataAutoArrange(self);
        //DLog();
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"pageNumber" ascending:YES];
        //DLog(@"_applications: %@", _applications);
        self.applications = [_applications sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
        //DLog(@"_applications: %@", _applications);
        UIMAApplication *lastApplication = [_applications lastObject];
        int lastPageNumber = lastApplication.pageNumber;
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
