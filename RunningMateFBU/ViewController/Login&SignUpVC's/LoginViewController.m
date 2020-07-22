//
//  LoginViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/13/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "LoginViewController.h"
@import Parse;

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapLogin:(id)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error == nil) {
            [self performSegueWithIdentifier:@"homeViewSegue" sender:nil];
        }
    }];
}

- (IBAction)didTapSignUp:(id)sender {
    [self performSegueWithIdentifier:@"signupSegue" sender:nil];
}


@end
