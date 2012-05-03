//
//  internalViewsViewController.h
//  internalViews
//
//  Created by David Rowland on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface InternalViewsViewController : UIViewController<UIWebViewDelegate> {
    UIWebView* webView;
    UIButton* forwardButton;
    UIButton* backButton;
}

@property (nonatomic, retain)UIWebView* webView;
@property (nonatomic, retain)UIButton* forwardButton;
@property (nonatomic, retain)UIButton* backButton;
@end

