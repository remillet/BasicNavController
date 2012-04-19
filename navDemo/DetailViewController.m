//
//  DetailViewController.m
//  navDemo
//
//

#import "DetailViewController.h"
#import "REMPentagonUIView.h"


@implementation DetailViewController

//Synthesize the drawing view.


- (void)dealloc
{
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setupPentagonView
{
    CGRect pentagonBounds = self.view.bounds;
    REMPentagonUIView *pentagonView = [[[REMPentagonUIView alloc] initWithFrame:pentagonBounds] autorelease];
    pentagonView.backgroundColor = [UIColor grayColor];
    pentagonView.drawPoint = pentagonView.center;
    [self.view addSubview:pentagonView];
    
    CGRect messageBox;
    messageBox.origin.x = 30;
    messageBox.origin.y = 30;
    messageBox.size.width = 200;
    messageBox.size.height = 30;
    UILabel *message = [[UILabel alloc] initWithFrame:messageBox];
    message.backgroundColor = [UIColor grayColor];
    [message setText:@"Tap to move the pentagon"];
    [pentagonView addSubview:message];
    
	UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:pentagonView action:@selector(handleTap:)];
	[tapRecognizer setNumberOfTapsRequired:1];
	[tapRecognizer setDelegate:pentagonView];
	[pentagonView addGestureRecognizer:tapRecognizer];
    
    NSLog(@"My frame is: %f, %f, %f, %f", pentagonView.frame.origin.x,
          pentagonView.frame.origin.y,
          pentagonView.frame.size.width,
          pentagonView.frame.size.height);
    NSLog(@"My bounds are: %f, %f, %f, %f", pentagonView.bounds.origin.x,
          pentagonView.bounds.origin.y,
          pentagonView.bounds.size.width,
          pentagonView.bounds.size.height);
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Detail VC";

    //Init your view and add as a subview
    
    [self setupPentagonView];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
							

@end
