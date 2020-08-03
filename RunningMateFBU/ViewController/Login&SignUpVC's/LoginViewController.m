//
//  LoginViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/13/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "LoginViewController.h"
#import "SCLAlertView.h"
@import Parse;

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UIView *fadeInView;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fadeInView.alpha = 0;
    [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{self.fadeInView.alpha = 1;} completion:NULL];
}

- (IBAction)didTapLogin:(id)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error == nil) {
            [self performSegueWithIdentifier:@"homeViewSegue" sender:nil];
        } else {
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            [alert showError:self title:@"Invalid Input"
                    subTitle:@"Your input did not match with any users in our current database. Please make sure you have correctly inputted in your credentials. If you do not have an account you can register for an account by cliking sign up at the bottom of your sceen."
            closeButtonTitle:@"OK" duration:0.0f];
        }
    }];
}

- (IBAction)didTapSignUp:(id)sender {
    [self performSegueWithIdentifier:@"signupSegue" sender:nil];
}

@end
