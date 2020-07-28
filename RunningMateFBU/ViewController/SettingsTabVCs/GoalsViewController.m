//
//  GoalsViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/15/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "GoalsViewController.h"
#import "WorkoutEvent.h"


@import Parse;

@interface GoalsViewController ()
@property (weak , nonatomic) IBOutlet UISegmentedControl *distanceSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeFrameSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeOfWorkoutSegmentedControl;
@end

@implementation GoalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)updateWorkoutPlan {
    NSDate *today = [NSDate date];
    PFQuery *updateQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [updateQuery whereKey:@"dateOfWorkout" greaterThanOrEqualTo:today];
    [updateQuery orderByAscending:@"dateOfWorkout"];
    [updateQuery findObjectsInBackgroundWithBlock:^(NSArray *deleteUpcomingEvents, NSError * error) {
        if (deleteUpcomingEvents && deleteUpcomingEvents.count != 0) {
            for (PFObject *event in deleteUpcomingEvents){
                [event deleteInBackground];
            }
        }
    }];
}

-(void)sendWorkoutPlanToParseWithDistance: (int long) workoutDistancePlan timeOfWorkout:(NSString *) timeOfWorkout timeFrame:(int long) amountOfWorkouts{
    NSInteger workoutDistance = 0;
    NSDate *dateOfWorkout = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay;
    NSInteger eventInterval = 2;
    NSInteger incrementEachEventBy = workoutDistancePlan / amountOfWorkouts;
    
    for (int i = 0; i < amountOfWorkouts ; i++) {
        
        workoutDistance =  workoutDistance + incrementEachEventBy;
        NSString *workoutEvent = [@(workoutDistance) stringValue];
        
        NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:eventInterval toDate:dateOfWorkout options:NSCalendarMatchStrictly];
        dateOfWorkout = nextWorkoutDate;
        
        WorkoutEvent *workout = [WorkoutEvent new];
        workout[@"workout"] = workoutEvent;
        workout[@"dateOfWorkout"] = dateOfWorkout;
        workout[@"timeOfDay"] = timeOfWorkout;
        workout[@"didFinishWorkout"] = @0;
        [workout saveInBackground];
    }
}

- (IBAction)didTapConfirmGoals:(id)sender {
    [self updateWorkoutPlan];
    NSInteger distanceSegmentIndex = [self.distanceSegmentedControl selectedSegmentIndex];
    NSInteger timeFrameSegmentIndex = [self.timeFrameSegmentedControl selectedSegmentIndex];
    NSInteger timeOfWorkoutSegmentIndex = [self.timeOfWorkoutSegmentedControl selectedSegmentIndex];
    
    int long workoutDistancePlan = 0;;
    int long amountOfWorkouts = 0;
    NSString *timeOfWorkout = @"";
    
    if (distanceSegmentIndex == 0) {
        workoutDistancePlan = 5000;
    } else if (distanceSegmentIndex == 1) {
        workoutDistancePlan = 10000;
    }else {
        workoutDistancePlan = 21082;
    }
    
    if (timeOfWorkoutSegmentIndex == 0) {
        timeOfWorkout =  @"8 AM";
    } else if (timeOfWorkoutSegmentIndex == 1) {
        timeOfWorkout = @"1 PM";
    }else {
        timeOfWorkout = @"7 PM" ;
    }
    
    if (timeFrameSegmentIndex == 0) {
        amountOfWorkouts = 15;
    } else if (timeFrameSegmentIndex == 1) {
        amountOfWorkouts = 30;
    }else {
        amountOfWorkouts = 45;
    }
    [self sendWorkoutPlanToParseWithDistance:workoutDistancePlan timeOfWorkout:timeOfWorkout timeFrame:amountOfWorkouts];
    
}

@end
