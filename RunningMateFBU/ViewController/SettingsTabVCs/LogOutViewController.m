//
//  LogOutViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/15/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "LogOutViewController.h"
#import "SceneDelegate.h"
#import "LoginViewController.h"
@import Parse;

@interface LogOutViewController ()

@end

@implementation LogOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if (error == nil){
            SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            sceneDelegate.window.rootViewController = loginViewController;
        }
    }];
}



@end
