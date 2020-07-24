//
//  GoalsViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/15/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "GoalsViewController.h"


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

- (IBAction)didTapConfirmGoals:(id)sender {
    NSInteger distanceSegmentIndex = [self.distanceSegmentedControl selectedSegmentIndex];
    NSInteger timeFrameSegmentIndex = [self.timeFrameSegmentedControl selectedSegmentIndex];
    NSInteger timeOfWorkoutSegmentIndex = [self.timeOfWorkoutSegmentedControl selectedSegmentIndex];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay;
    NSInteger value = 2;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *today = [NSDate date];
    NSMutableArray *dates = [NSMutableArray new];
    
    NSMutableArray *workouts =[NSMutableArray new];
    NSInteger workoutDistance = 0;
    NSInteger fiveKWorkouts = 5000;
    NSInteger tenKWorkouts = 10000;
    NSInteger halfMWorkouts = 21082.41;
    
    NSInteger oneMonthPlan = 15;
    NSInteger twoMonthPlan = 30;
    NSInteger threeMonthPlan = 45;
    
    if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 0) {
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            
            NSInteger incrementEachEventBy = fiveKWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 AM";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            
            NSInteger incrementEachEventBy = fiveKWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 2){
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            
            NSInteger incrementEachEventBy = fiveKWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 0){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            
            NSInteger incrementEachEventBy = fiveKWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 AM";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            
            NSInteger incrementEachEventBy = fiveKWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 2){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            NSInteger incrementEachEventBy = fiveKWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 0){
        
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = fiveKWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = fiveKWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 2){
        
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = fiveKWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 0) {
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 2){
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 0){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 2){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 0){
        
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 2){
        
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = tenKWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
    }
    else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 0) {
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 2){
        
        for (int i = 0; i <= oneMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / oneMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 0){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 2){
        
        for (int i = 0; i <= twoMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / twoMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 0){
        
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 1){
        
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 2){
        for (int i = 0; i <= threeMonthPlan ; i++) {
            NSInteger incrementEachEventBy = halfMWorkouts / threeMonthPlan;
            workoutDistance =  workoutDistance + incrementEachEventBy;
            NSString *workoutEvent = [@(workoutDistance) stringValue];
            
            [workouts addObject: workoutEvent];
            [dates addObject:today];
            
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:today options:NSCalendarMatchStrictly];
            today = nextWorkoutDate;
            
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = workoutEvent;
            workout[@"dateOfWorkout"] = today;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }
}

@end
