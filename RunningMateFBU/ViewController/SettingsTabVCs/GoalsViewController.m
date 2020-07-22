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
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 0) {
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 AM";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5K";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 0){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5K";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5K";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5K";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @" 8 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 0){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5K";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5K";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 0 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"5K";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 0) {
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 AM";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 0){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @" 8 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 0){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 1 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"10k";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }
    else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 0) {
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 AM";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    } else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 0 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 15 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 0){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 1 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 30 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @" 8 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 0){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"8 am";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 1){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"1 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
        
    }else if (distanceSegmentIndex == 2 && timeFrameSegmentIndex == 2 && timeOfWorkoutSegmentIndex == 2){
        NSMutableArray *dates = [NSMutableArray new];
        NSDate* dateOfEvent = today;
        for (int i = 0; i < 45 ; i++) {
            NSString* date = [dateFormatter stringFromDate:dateOfEvent];
            [dates addObject:date];
            NSDate *nextWorkoutDate= [calendar dateByAddingUnit:unit value:value toDate:dateOfEvent options:NSCalendarMatchStrictly];
            dateOfEvent = nextWorkoutDate;
        }
        
        for (id date in dates) {
            PFObject *workout = [PFObject objectWithClassName:@"WorkoutEvent"];
            workout[@"workout"] = @"HM";
            workout[@"dateOfWorkout"] = date;
            workout[@"timeOfDay"] = @"7 pm";
            workout[@"didFinishWorkout"] = @NO;
            [workout saveInBackground];
        }
    }
}

@end
