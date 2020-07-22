//
//  SignUpViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/14/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "SignUpViewController.h"
@import Parse;
@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapRegister:(id)sender {
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameTextField.text;
    newUser.password = self.passwordTextField.text;
    [newUser signUpInBackground];
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if (error == nil){
            [self performSegueWithIdentifier:@"goalsSegue" sender:nil];
        }
    }];
}

- (IBAction)didTapHaveAcount:(id)sender {
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
}

@end
