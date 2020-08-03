//
//  UpdateProfileViewController.h
//  RunningMateFBU
//
//  Created by denzeltov on 7/16/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Parse;

NS_ASSUME_NONNULL_BEGIN
@protocol UpdateProfileDelegate

-(void) didUpdateProfile: (UIImage *)newImage;

@end
@interface UpdateProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, weak) id <UpdateProfileDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
