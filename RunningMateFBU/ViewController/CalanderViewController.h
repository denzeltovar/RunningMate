//
//  CalanderViewController.h
//  RunningMateFBU
//
//  Created by denzeltov on 7/14/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"


NS_ASSUME_NONNULL_BEGIN

@interface CalanderViewController : UIViewController <FSCalendarDelegate, FSCalendarDataSource>

@end

NS_ASSUME_NONNULL_END
