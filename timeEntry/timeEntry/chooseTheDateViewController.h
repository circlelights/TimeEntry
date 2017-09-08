
//chooseTheDateViewController.h

#import <UIKit/UIKit.h>


@protocol chooseTheDateViewControllerDelegate;


@interface chooseTheDateViewController : UIViewController {
    id<chooseTheDateViewControllerDelegate> datedelegate;
    UIDatePicker    *datePicker;
}

@property (nonatomic, assign) id<chooseTheDateViewControllerDelegate> datedelegate;

@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;

@end

@protocol chooseTheDateViewControllerDelegate
-(void)displayDate:(NSDate *)theNewDate;
@end