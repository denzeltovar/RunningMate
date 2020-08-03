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
#import "SCLAlertView.h"
@import FSCalendar;
@import Parse;

@interface CalanderViewController ()<UITableViewDataSource,UITableViewDelegate,FSCalendarDataSource,FSCalendarDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet FSCalendar *calendar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSDateFormatter *dateFormatter2;
@property (strong, nonatomic) NSMutableArray *eventFromDate;
@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSMutableArray* datesArray;
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
    self.datesArray = [[NSMutableArray alloc] init];
    [self fetchEventsDotsForDates];
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
        }else {
            self.eventFromDate = nil;
            [self.tableView reloadData];
        }
    }];
}

-(void)fetchEventsDotsForDates {
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByAscending:@"dateOfWorkout"];
    [eventsQuery whereKeyExists:@"dateOfWorkout"];
    NSArray *eventObjects = [eventsQuery findObjects];
    if (eventObjects) {
        for (WorkoutEvent *event in eventObjects){
            NSString *dateString = [self.dateFormatter stringFromDate:event.dateOfWorkout];
            [self.datesArray addObject:dateString];
        }
        [self.calendar reloadData];
    }
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - <FSCalendarDataSource>

- (NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date {
    NSString *dateString = [self.dateFormatter stringFromDate:date];
    if ([self.datesArray containsObject:dateString]) {
        return 1;
    }
    return 0;
}


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
    if (self.eventFromDate.count > 0) {
        self.objectId = workout.objectId;
        cell.didFinishWorkoutSwitch.hidden = NO;
        cell.didFinishWorkoutLabel.text = @"Did you finish your workout?";
        cell.didFinishWorkoutSwitch.on = workout.didFinishWorkout;
        [cell.didFinishWorkoutSwitch addTarget:self action:@selector(didTapSwitch:) forControlEvents:UIControlEventValueChanged];
    } else {
        cell.eventDateLabel.text = nil;
        cell.didFinishWorkoutSwitch.hidden = YES;
        cell.eventWorkoutLabel.text = @"There is no event for today. Enjoy your rest day!";
        cell.didFinishWorkoutLabel.text = nil;
    }
    return cell;
}

- (IBAction)didTapSwitch:(id)sender {
    UISwitch* workoutSwitch = sender;
    PFQuery *query = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [query getObjectInBackgroundWithId:self.objectId block:^(PFObject *workout, NSError *error) {
        if (!error) {
            workout[@"didFinishWorkout"] = workoutSwitch.on ? @(1) : @(0);;
            if(workoutSwitch.on == 1){
                SCLAlertView *alert = [[SCLAlertView alloc] init];
                [alert showSuccess:self title:@"Keep it Up!" subTitle:@"Congrates on completing your workout! Keep up the good Work!" closeButtonTitle:@"Done" duration:7.0];
            }
            [workout saveInBackground];
        }
    }];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

@end
