//
//  HomeViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/14/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "HomeViewController.h"
#import "UserProfile.h"
#import <Parse/Parse.h>
#import "WorkoutEvent.h"

@import Parse;

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *upcomingWorkoutDate;
@property (weak, nonatomic) IBOutlet UILabel *upcomingWorkout;
@property (weak, nonatomic) IBOutlet UILabel *totalMilesRanLabel;
@property (weak, nonatomic) IBOutlet UILabel *personalMessageLabel;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSMutableArray *allEvents;
@property (strong, nonatomic) NSString *amountOfWorkoutsCompletedString;
@property (weak, nonatomic) IBOutlet UILabel *amountOfWorkoutsCompletedLabel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"EEEE, MMM d, yyyy";
    [super viewDidLoad];
    [self updateHomeView];
    [self updateActivity];
    [self fetchUserProfile];
}

-(void)fetchUserProfile{
    PFQuery *query = [PFQuery queryWithClassName:@"UserProfile"];
    [query whereKey:@"author" equalTo: [PFUser currentUser]];
    [query orderByDescending: @"updatedAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable userProfile, NSError * _Nullable error) {
        if (userProfile && userProfile.count != 0){
            self.userProfile = userProfile[0];
            self.profileImage.file = self.userProfile.image;
            self.personalMessageLabel.text = self.userProfile.personalMessage;
            self.usernameLabel.text = [PFUser currentUser].username;
            [self.profileImage loadInBackground];
        }
    }];
}

-(void)updateHomeView{
    NSDate *today = [NSDate date];
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByAscending:@"dateOfWorkout"];
    [eventsQuery whereKey:@"dateOfWorkout" greaterThanOrEqualTo:today];
    eventsQuery.limit = 1;
    [eventsQuery findObjectsInBackgroundWithBlock:^(NSArray* events, NSError *error) {
        if (events && events.count != 0) {
            WorkoutEvent *workout = events.firstObject;
            self.upcomingWorkout.text = [NSString stringWithFormat:@"Upcoming workout will consist of running %@ meters!", workout.workout];
            NSString *upcomingEventDate = [self.dateFormatter stringFromDate:workout.dateOfWorkout];
            self.upcomingWorkoutDate.text = [ @"Upcoming event is on," stringByAppendingString:upcomingEventDate];
            self.amountOfWorkoutsCompletedLabel.text = self.amountOfWorkoutsCompletedString;
        }
    }];
}


-(void)updateActivity{
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByAscending:@"dateOfWorkout"];
    [eventsQuery whereKeyExists:@"dateOfWorkout"];
    [eventsQuery findObjectsInBackgroundWithBlock:^(NSArray <WorkoutEvent *> * _Nullable events, NSError * _Nullable error) {
        if (events && events.count != 0) {
            self.allEvents = (NSMutableArray *) events;
            int finishedWorkoutsCounter = 0;
            for (PFObject *event in self.allEvents) {
                NSNumber *didFinishWorkout = [event valueForKey:@"didFinishWorkout"];
                if (didFinishWorkout == [NSNumber numberWithUnsignedShort:1]){
                    finishedWorkoutsCounter = finishedWorkoutsCounter + 1;
                }
            }
            NSInteger totalAmountOfWorkouts = events.count;
            self.amountOfWorkoutsCompletedString = [NSString stringWithFormat:@"You have completed %ld / %ld of your total workouts!",(long)finishedWorkoutsCounter, (long)totalAmountOfWorkouts];
        }
    }];
}

- (IBAction)didtapUpdateProfileImage:(id)sender {
    [self performSegueWithIdentifier:@"updateProfileSegue" sender:nil];
}


@end
