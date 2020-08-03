//
//  UpdateProfileViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/16/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "UpdateProfileViewController.h"
#import "UserProfile.h"
#import "SceneDelegate.h"
@import Parse;

@interface UpdateProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *createProfileImageView;
@property (weak, nonatomic) IBOutlet UITextField *createPersonalMessageTextField;
@end

@implementation UpdateProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
}

- (IBAction)didTapUpdateProfilePic:(id)sender {
    [UserProfile postUserImage:self.createProfileImageView.image withCaption:self.createPersonalMessageTextField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error){
        if (error == nil){
            [self.delegate didUpdateProfile: self.createProfileImageView.image];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

- (IBAction)didTapCancel:(id)sender {
    [self performSegueWithIdentifier:@"updateToHomeViewSegue" sender:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    self.createProfileImageView.image = [self resizeImage:editedImage withSize:CGSizeMake(414, 414)];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
