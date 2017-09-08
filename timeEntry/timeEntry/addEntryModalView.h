
//  addEntryModalView.h

#import <UIKit/UIKit.h>

@protocol addEntryModalViewDelegate  
-(void) doneButtonPressed:(NSMutableArray *) entries;
@end


@interface addEntryModalView : UIViewController {
    
    id<addEntryModalViewDelegate> delegate;
    
    UITextField *wdmtg;
    UITextField *time;
    UITextView *notes;
    
}
@property (nonatomic, assign) id<addEntryModalViewDelegate> delegate; 

@property (nonatomic, retain) IBOutlet UITextField *wdmtg;
@property (nonatomic, retain) IBOutlet UITextField *time;
@property (nonatomic, retain) IBOutlet UITextView *notes;

-(IBAction)keyboardBeGone: (id)sender;
-(IBAction) addAnotherPressed:(id) sender;
@end
