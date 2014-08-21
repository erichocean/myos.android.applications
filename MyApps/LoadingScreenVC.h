/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <UIKit/UIKit.h>

@interface LoadingScreenVC : UIViewController {
@package
    //UILabel *_loadingLabel;
    UIActivityIndicatorView *_activityIndicator;
}

- (void)stopAnimating;

@end
