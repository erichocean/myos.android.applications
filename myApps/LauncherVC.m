/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "LauncherVC.h"
#import "LauncherView.h"

#define _kUIPageControlHeight       20

@implementation LauncherVC

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:100.0/255.0 blue:0.0 alpha:1.0];
    CGRect frame = self.view.frame;
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height - _kUIPageControlHeight,
                                                                   frame.size.width, _kUIPageControlHeight)];
    _pageControl.numberOfPages = 2;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
    
    [_pageControl addTarget:self
                     action:@selector(pageControlValueChanged:)
           forControlEvents:UIControlEventValueChanged];
    
    _launcherView = [[LauncherView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - _kUIPageControlHeight)];
    _launcherView.delegate = self;
    //DLog();
    [self.view addSubview:_launcherView];
}

- (void)dealloc
{
    [_pageControl release];
    [_scrollView release];
    [_launcherView release];
    [super dealloc];
}

#pragma mark - Other delegates

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = round(scrollView.contentOffset.x / scrollView.bounds.size.width);
    //DLog(@"_pageControl.currentPage2: %d", _pageControl.currentPage);
}

- (void)gotoHomepage
{
    //DLog();
    _pageControl.currentPage = 0;
    _launcherView.contentOffset= CGPointMake(0, _launcherView.contentOffset.y);
}

#pragma mark - Actions

- (void)pageControlValueChanged:(id)sender
{
    //DLog(@"sender: %@", sender);
    [_launcherView setContentOffset:CGPointMake(_pageControl.currentPage * _launcherView.bounds.size.width, _launcherView.contentOffset.y)
                           animated:YES];
}

@end
