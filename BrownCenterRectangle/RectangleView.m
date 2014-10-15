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
        self.backgroundColor = [UIColor brownColor];//[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    }
    return self;
}

#pragma mark - Overridden methods

@end
