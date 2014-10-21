/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "CircleView.h"

@implementation CircleView

#pragma mark - Life cycle

- (id)initWithFrame:(CGRect)theFrame
{
    self = [super initWithFrame:theFrame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.layer.cornerRadius = theFrame.size.height / 2;
        self.layer.masksToBounds = YES;
    }
    return self;
}

#pragma mark - Overridden methods

@end
