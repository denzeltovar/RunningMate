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

@import Parse;

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDayTimestampLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDayWorkoutLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalMilesRanLabel;
@property (weak, nonatomic) IBOutlet UILabel *personalMessageLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
            [self.profileImage loadInBackground];
        }
    }];
}

- (IBAction)didtapUpdateProfileImage:(id)sender {
    [self performSegueWithIdentifier:@"updateProfileSegue" sender:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
