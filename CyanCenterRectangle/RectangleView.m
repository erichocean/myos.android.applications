/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "RectangleView.h"

@implementation RectangleView

#pragma mark - Life cycle

- (id)initWithFrame:(CGRect)theFrame
{
    self = [super initWithFrame:theFrame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
    }
    return self;
}

#pragma mark - Overridden methods

@end
