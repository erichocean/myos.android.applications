/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import "LoadingScreenVC.h"

@implementation LoadingScreenVC

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:255.0/255.0 alpha:1.0];
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    float textY = (screenBounds.size.height - _activityIndicator.frame.size.height) / 2;
    _activityIndicator.frame = CGRectMake((screenBounds.size.width - _activityIndicator.frame.size.width) / 2,
                                          (screenBounds.size.height - _activityIndicator.frame.size.height) / 2,
                                          _activityIndicator.frame.size.width, _activityIndicator.frame.size.height);
    //DLog();
    [self.view addSubview:_activityIndicator];
    [_activityIndicator startAnimating];
    //DLog();
    /*_loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, textY, screenBounds.size.width, _kLoadingTextHeight)];
    _loadingLabel.textColor = [UIColor whiteColor];
    _loadingLabel.textAlignment = UITextAlignmentCenter;
    //DLog();
    _loadingLabel.text = @"Loading ...";
    [self.view addSubview:_loadingLabel];*/
    //DLog();
}

- (void)dealloc
{
    //DLog(@"self: %@", self);
    //[_loadingLabel release];
    [_activityIndicator stopAnimating];
    [_activityIndicator release];
    [super dealloc];
}

#pragma mark - Delegates

#pragma mark - Actions

#pragma mark - Helpers

- (void)stopAnimating
{
    [_activityIndicator stopAnimating];
}

@end
