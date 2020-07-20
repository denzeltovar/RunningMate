//
//  CalanderViewController.m
//  RunningMateFBU
//
//  Created by denzeltov on 7/14/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "CalanderViewController.h"
#import "FSCalendar.h"
#import "WorkoutCell.h"
@import FSCalendar;

@interface CalanderViewController ()<UITableViewDataSource,UITableViewDelegate,FSCalendarDataSource,FSCalendarDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet FSCalendar *calendar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarHeightConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation CalanderViewController

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy/MM/dd";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.calendar.placeholderType = FSCalendarPlaceholderTypeNone;
    self.calendar.scope = FSCalendarScopeMonth;
    
    [self.calendar selectDate:[NSDate date] scrollToDate:YES];
    self.calendar.accessibilityIdentifier = @"calendar";
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}


#pragma mark - <FSCalendarDelegate>

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"did select date %@",[self.dateFormatter stringFromDate:date]);
    
    NSMutableArray *selectedDates = [NSMutableArray arrayWithCapacity:calendar.selectedDates.count];
    [calendar.selectedDates enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [selectedDates addObject:[self.dateFormatter stringFromDate:obj]];
    }];
    NSLog(@"selected dates is %@",selectedDates);
    if (monthPosition == FSCalendarMonthPositionNext || monthPosition == FSCalendarMonthPositionPrevious) {
        [calendar setCurrentPage:date animated:YES];
    }
}



#pragma mark - <UITableViewDataSource>

- (nonnull UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WorkoutCell *cell =[tableView dequeueReusableCellWithIdentifier:@"WorkoutCell"];
    cell.eventDateLabel.text = @"Workout Date";
    cell.todaysDate.text = @"Today's Date";
    cell.didFinishWorkoutLabel.on = YES;
    cell.eventWorkoutLabel.text = @"Today's workout will consist of 1/2 mile walk, 1 mile run, and then a 1/2 cooldown";
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
