
//  addEntryModalView.m


#import "addEntryModalView.h"


@implementation addEntryModalView

@synthesize delegate, wdmtg, time, notes;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.wdmtg becomeFirstResponder];
}

-(IBAction)keyboardBeGone: (id)sender{
    [wdmtg resignFirstResponder];
    [time resignFirstResponder];
    [notes resignFirstResponder];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    [textField resignFirstResponder];
    return YES;
}

//This method should enable the return or send key to clear all entries.
- (BOOL) textViewShouldReturn: (UITextView *) textView {
    [self addAnotherPressed:self];
    return YES;
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
    [super viewDidLoad];
    // Done Bar Button and Method.
    self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc]
      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
      target:self action:@selector(buttonPressed:) ]
     autorelease];
}

- (void) buttonPressed:(id) sender {
    //array of the three fields
    NSMutableArray *entries = [[NSMutableArray alloc]
                        initWithObjects:wdmtg.text,time.text,
                        notes.text,nil];
    // delegate passing the information
    [delegate doneButtonPressed:entries];
    [entries release];
}


- (IBAction) addAnotherPressed:(id) sender {
    //array of the three fields
    NSMutableArray *entries = [[NSMutableArray alloc]
                               initWithObjects:wdmtg.text,time.text,
                               notes.text,nil];
    if
        (wdmtg.text != nil)
        (wdmtg.text = nil);
    if
        (time.text != nil)
        (time.text = nil);
    if 
        (notes.text != nil)
        (notes.text = nil);

    // delegate passing the information
    [entries release];
}

- (void)viewDidUnload
{
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
    [super dealloc];
    delegate = nil;
    [wdmtg release];
    [time release];
    [notes release];
}


@end