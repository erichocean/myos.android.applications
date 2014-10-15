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
        self.backgroundColor = [UIColor brownColor];
    }
    return self;
}

#pragma mark - Overridden methods
/*
- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor] set];
    [[UIColor redColor] setFill];
    NSRectFill(NSMakeRect(0,0,200,100));
}*/

@end
