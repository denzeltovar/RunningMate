//
//  WorkoutPlan.h
//  RunningMateFBU
//
//  Created by denzeltov on 7/20/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutPlan : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) NSString *timeOfDay;
@property (nonatomic) BOOL *didFinishWorkout;
@property (nonatomic, strong) NSString *workout;

@end

NS_ASSUME_NONNULL_END
