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
#import "UpdateProfileViewController.h"
@import Parse;

@interface HomeViewController () <UpdateProfileDelegate>
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *upcomingWorkoutDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *upcomingWorkoutLabel;
@property (weak, nonatomic) IBOutlet UILabel *personalMessageLabel;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSMutableArray *allEventsArray;
@property (strong, nonatomic) NSString *amountOfWorkoutsCompletedString;
@property (weak, nonatomic) IBOutlet UILabel *amountOfWorkoutsLeftLabel;
@property (strong, nonatomic) NSString *amountOfWorkoutsLeftString;
@property (weak, nonatomic) IBOutlet UILabel *amountOfWorkoutsCompletedLabel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"EEEE, MMM d, yyyy";
    [self updateHomeView];
    [self updateActivity];
    [self fetchUserProfile];
    [self amountOfWorkoutsRemaining];
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
            self.amountOfWorkoutsLeftLabel.text = self.amountOfWorkoutsLeftString;
            [self.profileImage loadInBackground];
        }
    }];
}

- (void)didUpdateProfile:(UIImage *)newImage personalMessage:(NSString *)personalMessage{
    self.profileImage.image = newImage;
    self.personalMessageLabel.text = personalMessage;
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self.profileImage setImage:newImage];
    });
}

-(void)updateHomeView{
    NSDate *today = [NSDate date];
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByAscending:@"dateOfWorkout"];
    [eventsQuery whereKey:@"dateOfWorkout" greaterThanOrEqualTo:today];
    [eventsQuery whereKey:@"author" equalTo:[PFUser currentUser]];
    eventsQuery.limit = 1;
    [eventsQuery findObjectsInBackgroundWithBlock:^(NSArray* events, NSError *error) {
        if (events && events.count != 0) {
            WorkoutEvent *workout = events.firstObject;
            self.upcomingWorkoutLabel.text = [NSString stringWithFormat:@"Upcoming workout will consist of running %@ meters!", workout.workout];
            NSString *upcomingEventDate = [self.dateFormatter stringFromDate:workout.dateOfWorkout];
            self.upcomingWorkoutDateLabel.text = [ @"Upcoming event is on," stringByAppendingString:upcomingEventDate];
            self.amountOfWorkoutsCompletedLabel.text = self.amountOfWorkoutsCompletedString;
        }
    }];
}

-(void)amountOfWorkoutsRemaining{
    
    NSDate *today = [NSDate date];
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByAscending:@"dateOfWorkout"];
    [eventsQuery whereKey:@"dateOfWorkout" greaterThanOrEqualTo:today];
    [eventsQuery whereKey:@"author" equalTo:[PFUser currentUser]];
    [eventsQuery findObjectsInBackgroundWithBlock:^(NSArray* events, NSError *error) {
        if (events && events.count != 0) {
            int amountOfworkoutsRemaining = 0;
            for (int i= 0; i <= events.count; i++){
                amountOfworkoutsRemaining = amountOfworkoutsRemaining + 1;
            }
            self.amountOfWorkoutsLeftString = [NSString stringWithFormat:@"You have a total of %d workouts remaining" ,amountOfworkoutsRemaining];
        }
    }];    
}


-(void)updateActivity{
    NSDate *today = [NSDate date];
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByAscending:@"dateOfWorkout"];
    [eventsQuery whereKey:@"dateOfWorkout" lessThanOrEqualTo:today];
    [eventsQuery whereKey:@"author" equalTo:[PFUser currentUser]];
    [eventsQuery findObjectsInBackgroundWithBlock:^(NSArray <WorkoutEvent *> * _Nullable events, NSError * _Nullable error) {
        if (events && events.count != 0) {
            self.allEventsArray = (NSMutableArray *) events;
            int finishedWorkoutsCounter = 0;
            for (PFObject *event in self.allEventsArray) {
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

- (IBAction)longPressGesture:(id)sender {
    [self performSegueWithIdentifier:@"updateProfileSegue" sender:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"updateProfileSegue"]) {
        UpdateProfileViewController *updateProfileController = [segue destinationViewController];
        updateProfileController.delegate = self;
    }
}
@end
