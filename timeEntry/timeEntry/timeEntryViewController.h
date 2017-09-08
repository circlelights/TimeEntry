//This is the timeEntryViewController.h or the root view

#import <UIKit/UIKit.h>
#import "addEntryModalView.h"
#import "chooseTheDateViewController.h"

@interface timeEntryViewController : UIViewController 
<addEntryModalViewDelegate, chooseTheDateViewControllerDelegate>{
    
    IBOutlet UILabel *datedisplayed;
    NSTimer *theDay;
    UIPopoverController *pickadate;
    UITableViewCell *theCell;
    UITableViewCell *theHeaderCell;
}

@property (nonatomic, retain) UILabel *datedisplayed;
@property (nonatomic, retain) UIPopoverController *pickadate;
@property (nonatomic, assign) IBOutlet UITableViewCell *theCell;
@property (nonatomic, assign) IBOutlet UITableViewCell *theHeaderCell;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;


-(IBAction)entryModal:(id)sender;
-(IBAction)dateChanged:(id) sender;
@end
