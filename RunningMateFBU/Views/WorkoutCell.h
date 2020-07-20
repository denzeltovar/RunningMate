//
//  WorkoutCell.h
//  RunningMateFBU
//
//  Created by denzeltov on 7/19/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *eventDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *todaysDate;
@property (weak, nonatomic) IBOutlet UILabel *eventWorkoutLabel;
@property (weak, nonatomic) IBOutlet UISwitch *didFinishWorkoutLabel;


@end

NS_ASSUME_NONNULL_END
