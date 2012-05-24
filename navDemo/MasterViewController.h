//
//  MasterViewController.h
//  navDemo
//
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class InternalViewsViewController;
@class TextViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) InternalViewsViewController *internalViewsViewController;
@property (strong, nonatomic) TextViewController *textViewController;

@end
