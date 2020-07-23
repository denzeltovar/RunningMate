//
//  SettingsTableViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/14/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SettingsTableViewController

@dynamic tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}



@end
