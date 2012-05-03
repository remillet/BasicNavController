//
//  MasterViewController.h
//  navDemo
//
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class InternalViewsViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) InternalViewsViewController *internalViewsViewController;

@end
