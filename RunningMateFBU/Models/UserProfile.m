//
//  UserProfile.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/16/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic personalMessage;
@dynamic image;


+ (nonnull NSString *)parseClassName {
    return @"UserProfile";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )personalMessage withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    UserProfile *newPost = [UserProfile new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.personalMessage = personalMessage;
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
 
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName: @"image.png" data:imageData];
}



@end
