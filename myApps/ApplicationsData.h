/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>

@interface ApplicationsData : NSObject {
@package
    NSMutableArray *_applications;
    NSMutableArray *_applicationsPages;
}

@property (nonatomic, retain) NSMutableArray *applications;
@property (nonatomic, retain) NSMutableArray *applicationsPages;

+ (ApplicationsData *)sharedData;
- (void)rearrageApplications;

@end
