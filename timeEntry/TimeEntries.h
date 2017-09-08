//
//  TimeEntries.h


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TimeEntries : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * wdmtg;
@property (nonatomic, retain) id time;
@property (nonatomic, retain) NSString * notes;

@end
