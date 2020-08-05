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
@property (weak, nonatomic) IBOutlet UILabel *amountOfWorkoutsLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountOfWorkoutsCompletedLabel;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"EEEE, MMM d, yyyy";
    
    [self fetchUserProfile];
    [self fetchDataForHomeStream];
}

-(void)fetchUserProfile{
    PFQuery *query = [PFQuery queryWithClassName:@"UserProfile"];
    [query whereKey:@"author" equalTo: [PFUser currentUser]];
    [query orderByDescending: @"updatedAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable userProfile, NSError * _Nullable error) {
        if (userProfile && userProfile.count != 0){
            self.usernameLabel.text = [PFUser currentUser].username;
            self.userProfile = userProfile[0];
            self.profileImage.file = self.userProfile.image;
            self.personalMessageLabel.text = self.userProfile.personalMessage;
            [self.profileImage loadInBackground];
        }
    }];
}

-(void)fetchDataForHomeStream{
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByDescending:@"dateOfWorkout"];
    [eventsQuery whereKeyExists:@"dateOfWorkout"];
    [eventsQuery whereKey:@"author" equalTo:[PFUser currentUser]];
    NSArray *eventObjects = [eventsQuery findObjects];
    int amountOfworkoutsRemaining = 0;
    int finishedWorkoutsCounter = 0;
    int totalAmountofWorkouts = 0;
    if (eventObjects) {
        for (WorkoutEvent *event in eventObjects) {
            if ([[NSDate date] compare:event.dateOfWorkout] == NSOrderedAscending){
                self.upcomingWorkoutLabel.text = [NSString stringWithFormat:@"Upcoming workout will consist of running %@ meters!", event.workout];
                NSString *upcomingEventDate = [self.dateFormatter stringFromDate:event.dateOfWorkout];
                self.upcomingWorkoutDateLabel.text = [ @"Upcoming event is on," stringByAppendingString:upcomingEventDate];
                amountOfworkoutsRemaining = amountOfworkoutsRemaining + 1;
            } else {
                NSNumber *didFinishWorkout = [event valueForKey:@"didFinishWorkout"];
                if ( didFinishWorkout == [NSNumber numberWithUnsignedShort:1]){
                    finishedWorkoutsCounter = finishedWorkoutsCounter + 1;
                    totalAmountofWorkouts = totalAmountofWorkouts + 1;
                }else {
                    totalAmountofWorkouts = totalAmountofWorkouts + 1;
                }
            }
        }
    }
    self.amountOfWorkoutsLeftLabel.text = [NSString stringWithFormat:@"You have a total of %d workouts remaining" ,amountOfworkoutsRemaining];
    self.amountOfWorkoutsCompletedLabel.text = [NSString stringWithFormat:@"You have completed %ld / %ld of your total workouts!",(long)finishedWorkoutsCounter, (long)totalAmountofWorkouts];
}


#pragma mark - <UpdateProfileDelegate>
- (void)didUpdateProfile:(UIImage *)newImage personalMessage:(NSString *)personalMessage{
    self.profileImage.image = newImage;
    self.personalMessageLabel.text = personalMessage;
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self.profileImage setImage:newImage];
    });
}

#pragma mark - <Segues>
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"updateProfileSegue"]) {
        UpdateProfileViewController *updateProfileController = [segue destinationViewController];
        updateProfileController.delegate = self;
    }
}

- (IBAction)didtapUpdateProfileImage:(id)sender {
    [self performSegueWithIdentifier:@"updateProfileSegue" sender:nil];
}

- (IBAction)longPressGesture:(id)sender {
    [self performSegueWithIdentifier:@"updateProfileSegue" sender:nil];
}

@end
