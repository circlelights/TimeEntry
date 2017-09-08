
//  timeEntryViewController.m

#import "timeEntryViewController.h"
#import "chooseTheDateViewController.h"
#import "TimeEntries.h"


@implementation timeEntryViewController
NSMutableArray *listOfMovies;

@synthesize datedisplayed, pickadate, theCell, theHeaderCell;
@synthesize managedObjectContext=__managedObjectContext;


//Popover window displays through this Method, dd is for different date
-(IBAction)dateChanged: (id) sender{
    if ([pickadate isPopoverVisible])	{
        [pickadate dismissPopoverAnimated:YES];
	}
	else {
        chooseTheDateViewController *dd = [[chooseTheDateViewController alloc] init];
        dd.datedelegate = self;
        pickadate = [[UIPopoverController alloc]
                     initWithContentViewController:dd];
        [dd release];
        
        pickadate.popoverContentSize = CGSizeMake(275, 325);
        [pickadate presentPopoverFromBarButtonItem:sender 
                          permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}  


//New date should display when button from Popover is pressed 
-(void)displayDate:(NSDate *)theNewDate{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat		setDateFormat:@"MMMM	d,	YYYY"];
    datedisplayed.text	=	[dateFormat	stringFromDate:theNewDate];

    [dateFormat release];
}


-(IBAction) entryModal:(id)sender {
    addEntryModalView *entry = [[addEntryModalView alloc] init];
    entry.delegate = self;
    
    UINavigationController *ent = [[UINavigationController alloc]
                                   initWithRootViewController:entry];
    
    ent.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    ent.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentModalViewController:ent animated:YES];
    
    [entry release];
    [ent release];
}

- (void)doneButtonPressed: (NSMutableArray *)entries  
{
    [self dismissModalViewControllerAnimated:YES];
    /*   
    NSString *message = 
    [[NSString alloc]
     initWithFormat:@"The entry is %@, %@ and %@",
     [entries objectAtIndex:0],[entries objectAtIndex:1],
     [entries objectAtIndex:2]];
    
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Entries Sent"
                               message:message delegate:nil cancelButtonTitle:@"Great! Are You Sure You're Done?" otherButtonTitles:nil ];
    
    [alert show];
    [alert release];
    [message release];

     */
}

/*
-(void)addEntries {
    
    TimeEntries *tms = (TimeEntries *)[NSEntityDescription
                                       insertNewObjectForEntityForName:@"TimeEntries"
                                       inManagedObjectContext:__managedObjectContext];
//    [tms wdmtg:[NSString];
//     [tms time:[NSDate];
//      [tms notes:[NString];
}
*/


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    NSDate  *today = [[NSDate alloc] init];
    NSDateFormatter *dateFormatted = [[NSDateFormatter alloc] init];
    [dateFormatted		setDateFormat:@"MMMM	d,	YYYY"];
    datedisplayed.text	=	[dateFormatted	stringFromDate:today];
    [today release];
    [dateFormatted release];
    
    listOfMovies = [[NSMutableArray alloc] init];
    
    //---add items---
    [listOfMovies addObject:@"Service"];
    [listOfMovies addObject:@"Watching TV"];
    [listOfMovies addObject:@"Gym"];
    [listOfMovies addObject:@"School"];
    [listOfMovies addObject:@"College Study"];
    [listOfMovies addObject:@"Meeting"];
    [listOfMovies addObject:@"Running"];
    [listOfMovies addObject:@"Cycling"];
    [listOfMovies addObject:@"Weight Lifting"];
    [listOfMovies addObject:@"Surfing the Web"];
    [listOfMovies addObject:@"Reading a Book"];
    [listOfMovies addObject:@"Shopping"];
    [listOfMovies addObject:@"Visiting the Museum"];
    
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

#pragma mark
#pragma mark - Table Data Source Delegate Methods

//This is an optional method, the default will output to 1 Section if not implemented.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//This is a required method.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listOfMovies count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"theCellView" owner:self options:nil];
        cell = theCell;
        self.theCell = nil;
        //        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell.
    NSString *cellValue = [listOfMovies objectAtIndex:indexPath.row];
    
    //   cell.textLabel.text = cellValue;
    UILabel *thelabel;
    thelabel = (UILabel *)[cell viewWithTag:1];
    thelabel.text = [NSString stringWithFormat:cellValue, indexPath.row];
    
    thelabel = (UILabel *)[cell viewWithTag:2];
    
    return cell;
    //Method to enable a title over the table -JI
}
/*
 - (void)loadView {
 [super loadView];
 
 CGRect titleRect = CGRectMake(0, 0, 300, 40);
 UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
 tableTitle.textColor = [UIColor grayColor];
 tableTitle.opaque = YES;
 tableTitle.text = @"ENTRIES";
 self.tableView.tableHeaderView = tableTitle;
 [self.tableView reloadData];
 [tableTitle release];
 [super viewDidLoad];
 }
 }
 */

 //Method to enable deletion of cells within the table -JI
 -(void)tableView:(UITableView *)sender
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath;
 {

 }
 

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return @"    WDMTG";
}

- (void)dealloc
{
    [addEntryModalView dealloc];
    [datedisplayed dealloc];
    [pickadate dealloc];
    [listOfMovies release];
    
    [super dealloc];
}


@end
