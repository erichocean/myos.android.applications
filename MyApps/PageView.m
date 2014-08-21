/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "PageView.h"
#import <UIKit/UIKit-private.h>

#define _kIconWidth                 80
#define _kIconHeight                92
#define _kUIPageControlHeight       20

@implementation PageView

#pragma mark - Life cycle

- (id)initWithFrame:(CGRect)theFrame andApplicationsPage:(ApplicationsPage *)applicationsPage
{
    self = [super initWithFrame:theFrame];
    if (self) {
        _icons = [[NSArray alloc] initWithObjects:
                  [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                  [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                  [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                  [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                  [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                  [[[NSMutableArray alloc] initWithObjects:[NSNull null], [NSNull null], [NSNull null], [NSNull null], nil] autorelease],
                  nil];
        _applicationsPage = applicationsPage;
        _applicationsPage->_delegate = self;
        //self.backgroundColor = [UIColor lightGrayColor];
        //DLog(@"[NSNull null]: %p", [NSNull null]);
        for (NSArray *row in _applicationsPage->_applications) {
            for (UIMAApplication *application in row) {
                //DLog(@"application: %p", application);
                if (application != [NSNull null]) {
                    //DLog(@"application: %@", application);
                    UIView *icon = application->_applicationIcon;
                    icon.frame = CGRectMake(_kIconWidth * application.xLocation, _kIconHeight * application.yLocation,
                                            icon.frame.size.width, icon.frame.size.height);
                    [self addSubview:icon];
                }
            }
        }
        //DLog(@"self: %@", self);
        /*self.backgroundColor = [UIColor colorWithRed:0.0 green:100.0/255.0 blue:0.0 alpha:1.0];
        
        CGRect frame;
        IconView *iconView;
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, theFrame.size.height - _kUIPageControlHeight, theFrame.size.width, _kUIPageControlHeight)];
        _pageControl.numberOfPages = 2;
        _pageControl.currentPage = 0;
        [self addSubview:_pageControl];
        
        [_pageControl addTarget:self
                         action:@selector(pageControlValueChanged:)
               forControlEvents:UIControlEventValueChanged];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, theFrame.size.width, theFrame.size.height - _kUIPageControlHeight)];
        //DLog();
        [self addSubview:_scrollView];
        //DLog();
        
        UIView *_brownView = [[UIView alloc] initWithFrame:CGRectMake(100,200,150,150)];
        _brownView.backgroundColor = [UIColor brownColor];
        [_scrollView addSubview:_brownView];*/
    }
    return self;
}

- (void)dealloc
{
    [_icons release];
    [super dealloc];
}

#pragma mark - Overridden methods

#pragma mark - Delegates

- (void)applicationWillMove:(UIMAApplication *)application
{
    
}

- (void)applicationDidMove:(UIMAApplication *)application
{
    
}

#pragma mark - Actions

@end

#pragma mark - Shared functions

void PageViewLoadIcons(PageView *pageView)
{
    
}
