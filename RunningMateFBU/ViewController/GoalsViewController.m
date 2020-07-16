//
//  GoalsViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/15/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "GoalsViewController.h"

@interface GoalsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeFrameSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeOfWorkoutSegmentedControl;

@end

@implementation GoalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didTapConfirmGoals:(id)sender {
    [self performSegueWithIdentifier:@"TabBarViewController" sender:nil];
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
