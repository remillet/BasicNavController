//
//  internalViewsViewController.m
//  internalViews
//
//  Created by David Rowland on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InternalViewsViewController.h"

@implementation InternalViewsViewController

@synthesize webView;
@synthesize backButton;
@synthesize forwardButton;

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //for web views, we must #import <UIKit/UIKit.h>,
    //reference the UIKit framework,
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    webView = [[UIWebView alloc] initWithFrame:screenRect];
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView setDelegate:self];
    [webView setScalesPageToFit:YES];
    [self.view addSubview:webView];
    [webView release];
    NSString * urlString = @"http://apple.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    //can add buttons for forward and back web navigation
    CGRect frame = CGRectMake(80, 360, 50, 30);
    forwardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [forwardButton setTitle:@"☛" forState:UIControlStateNormal];
    [forwardButton setFrame:frame];
    [webView addSubview:forwardButton];
    [forwardButton addTarget:webView action:@selector(goForward) forControlEvents:UIControlEventTouchUpInside];
    
    //can add buttons for forward and back web navigation
    frame = CGRectMake(20, 360, 50, 30);
    backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"☚" forState:UIControlStateNormal];
    [backButton setFrame:frame];
    [webView addSubview:backButton];
    [backButton addTarget:webView action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
	

}


#pragma mark webView delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //test the state of canGoForward and canGoBack
    //and enable or disable the buttons accordingly
    //The button action methods should call goBack or goForward.
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
