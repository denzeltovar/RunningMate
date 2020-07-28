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
#import "WorkoutEvent.h"
@import FSCalendar;
@import Parse;

@interface CalanderViewController ()<UITableViewDataSource,UITableViewDelegate,FSCalendarDataSource,FSCalendarDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet FSCalendar *calendar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarHeightConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSDateFormatter *dateFormatter2;
@property (strong, nonatomic) NSMutableArray *eventFromDate;
@property (strong, nonatomic) NSString *objectId;

@end

@implementation CalanderViewController

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy-MM-dd";
        
        self.dateFormatter2 = [[NSDateFormatter alloc] init];
        self.dateFormatter2.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
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

-(void)fetchEventsForDates:(NSDate *)date {
    NSTimeInterval oneDay = (double) 24 * 60 * 60;
    
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByAscending:@"dateOfWorkout"];
    [eventsQuery whereKey:@"dateOfWorkout" lessThan:[date dateByAddingTimeInterval:oneDay]];
    [eventsQuery whereKey:@"dateOfWorkout" greaterThanOrEqualTo:date];
    eventsQuery.limit = 1;
    
    [eventsQuery findObjectsInBackgroundWithBlock:^(NSArray<WorkoutEvent *> * _Nullable events, NSError * _Nullable error) {
        if (events && events.count != 0) {
            self.eventFromDate = (NSMutableArray *) events;
            [self.tableView reloadData];
        }
    }];
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - <FSCalendarDataSource>

- (NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date {
    NSString *currentDate = [self.dateFormatter stringFromDate:date];
    if ([self.eventFromDate containsObject:currentDate]) {
        return 1;
    }
    return 0;}


#pragma mark - <FSCalendarDelegate>

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition {
    if (monthPosition == FSCalendarMonthPositionNext || monthPosition == FSCalendarMonthPositionPrevious) {
        [calendar setCurrentPage:date animated:YES];
    }
    [self fetchEventsForDates:date];
}

#pragma mark - <UITableViewDataSource>

- (nonnull UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WorkoutCell *cell =[tableView dequeueReusableCellWithIdentifier:@"WorkoutCell"];
    WorkoutEvent *workout = self.eventFromDate[indexPath.row];
    NSDate *eventDate = workout.dateOfWorkout;
    NSString *eventDateString = [_dateFormatter stringFromDate:eventDate];
    cell.eventDateLabel.text = eventDateString;
    cell.eventWorkoutLabel.text = [NSString stringWithFormat:@"Todays workout will consist of running %@ meters", workout.workout];
    cell.didFinishWorkoutSwitch.on = workout.didFinishWorkout;
    self.objectId = workout.objectId;
    [cell.didFinishWorkoutSwitch addTarget:self action:@selector(didTapSwitch:) forControlEvents:UIControlEventValueChanged];
    return cell;
}

- (IBAction)didTapSwitch:(id)sender {
    UISwitch* workoutSwitch = sender;
    int didFinishWorkoutSwitch = 0;
    if (workoutSwitch.on == 0) {
        didFinishWorkoutSwitch = 0;
    }else {
        didFinishWorkoutSwitch = 1;
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"WorkoutEvent"];
       [query getObjectInBackgroundWithId:self.objectId block:^(PFObject *workout, NSError *error) {
           if (!error) {
               workout[@"didFinishWorkout"] = @(didFinishWorkoutSwitch);
               [workout saveInBackground];
           }
       }];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

@end
