//
//  UserProfile.h
//  RunningMateFBU
//
//  Created by denzeltov on 7/16/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserProfile : PFObject <PFSubclassing>
@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) NSString *personalMessage;
@property (nonatomic, strong) PFFileObject *image;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )personalMessage withCompletion: (PFBooleanResultBlock  _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
