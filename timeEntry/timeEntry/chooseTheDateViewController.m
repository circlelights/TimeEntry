
//  chooseTheDateViewController.m


#import "chooseTheDateViewController.h"


@implementation chooseTheDateViewController
@synthesize datedelegate, datePicker;


//Date should display on first screen through this Method
-(IBAction)theDate: (id)sender{
    NSDate *selected = [datePicker date];
    if (datedelegate != nil) {
        [datedelegate displayDate:selected];
    }
    /*
    NSString *message = [[NSString alloc] initWithFormat:@"The date you selected is: %@", selected];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Date Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did." otherButtonTitles:nil];
    [alert show];
    [alert release];
    [message release];
    */
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSDate  *today = [[NSDate alloc] init];
    [datePicker     setDate:today animated:NO];
    [today release];
}

// Do any additional setup after loading the view from its nib.

- (void)viewDidUnload
{
    self.datePicker = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void)dealloc
{
    [datePicker release];
    [super dealloc];
    datedelegate = nil;
    }


@end
