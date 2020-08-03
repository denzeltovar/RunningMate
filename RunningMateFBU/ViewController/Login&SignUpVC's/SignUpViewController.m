//
//  SignUpViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/14/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "SignUpViewController.h"
#import "SCLAlertView.h"
@import Parse;
@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UIView *fadeInView;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fadeInView.alpha = 0;
          [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{self.fadeInView.alpha = 1;} completion:NULL];
}

- (void) registerAccount{
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameTextField.text;
    newUser.password = self.passwordTextField.text;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(succeeded){
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
    }];
}

- (IBAction)didTapRegister:(id)sender {
    if (self.usernameTextField.text.length > 3 && self.passwordTextField.text.length > 3 && self.usernameTextField.text.length < 12 && self.passwordTextField.text.length < 12){
        [self registerAccount];
    } else {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showError:self title:@"Invalid Input"
                subTitle:@"Please be aware in order to register your account both your Username and Password must have a minumum of 3 characters and a max of 12."
        closeButtonTitle:@"OK" duration:0.0f];
    }
}

- (IBAction)didTapHaveAcount:(id)sender {
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
}

@end
