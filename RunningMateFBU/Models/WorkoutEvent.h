//
//  WorkoutEvent.h
//  RunningMateFBU
//
//  Created by denzeltov on 7/23/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutEvent : PFObject <PFSubclassing>
@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *workout;
@property (nonatomic, strong) NSString *timeOfDay;
@property (nonatomic, strong) NSDate *dateOfWorkout;
@property (nonatomic) BOOL *didFinishWorkout;

@end

NS_ASSUME_NONNULL_END
