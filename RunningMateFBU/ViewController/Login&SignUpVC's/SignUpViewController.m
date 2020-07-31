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
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Invalid Credentials!" message:@"Username and Password must have at min of 3 characters and a max of 12." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)didTapHaveAcount:(id)sender {
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
}

@end
