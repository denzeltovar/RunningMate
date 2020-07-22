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
@property (strong, nonatomic) NSDateFormatter *dateFormatter2;

@property (strong, nonatomic) NSArray *datesWithEvent;
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
        
        self.datesWithEvent = @[@"2020-07-03",
                                   @"2020-07-06",
                                   @"2020-07-12",
                                   @"2020-07-25"];
        
        self.dateFormatter2 = [[NSDateFormatter alloc] init];
        self.dateFormatter2.dateFormat = @"yyyy-MM-dd";
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

#pragma mark - <FSCalendarDataSource>

- (NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date {
    NSString *dateString = [self.dateFormatter2 stringFromDate:date];
    if ([_datesWithEvent containsObject:dateString]) {
        return 1;
    }
    return 0;
}


#pragma mark - <FSCalendarDelegate>

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSMutableArray *selectedDates = [NSMutableArray arrayWithCapacity:calendar.selectedDates.count];
    [calendar.selectedDates enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [selectedDates addObject:[self.dateFormatter stringFromDate:obj]];
    }];
    
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

@end
