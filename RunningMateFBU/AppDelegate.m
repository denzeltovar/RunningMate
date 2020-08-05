//
//  AppDelegate.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/13/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "AppDelegate.h"
@import Parse;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ParseClientConfiguration *config = [ParseClientConfiguration   configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        configuration.applicationId = @"runningDT";
        configuration.server = @"http://runningmatefbu.herokuapp.com/parse";
    }];
    [Parse initializeWithConfiguration:config];
    return YES;
}




#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {

}


@end
