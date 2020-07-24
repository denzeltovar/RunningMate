//
//  WorkoutEvent.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/23/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "WorkoutEvent.h"

@implementation WorkoutEvent

@dynamic postID;
@dynamic userID;
@dynamic didFinishWorkout;
@dynamic dateOfWorkout;
@dynamic timeOfDay;
@dynamic workout;


+ (nonnull NSString *)parseClassName {
return @"WorkoutEvent";
}

@end
