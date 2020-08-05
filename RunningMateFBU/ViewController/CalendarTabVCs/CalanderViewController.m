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
@property (strong, nonatomic) NSMutableArray *eventFromDate;
@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSMutableArray* datesArray;
@end

@implementation CalanderViewController

-(void)viewWillAppear:(BOOL)animated {
    [self fetchEventsForDates:self.calendar.selectedDate];
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy-MM-dd";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calendar.scope = FSCalendarScopeMonth;
    [self.calendar selectDate:[NSDate date] scrollToDate:YES];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.datesArray = [[NSMutableArray alloc] init];
}

-(void)fetchEventsForDates:(NSDate *)date {
    PFQuery *eventsQuery = [PFQuery queryWithClassName:@"WorkoutEvent"];
    [eventsQuery orderByAscending:@"dateOfWorkout"];
    [eventsQuery whereKeyExists:@"dateOfWorkout"];
    [eventsQuery whereKey:@"author" equalTo:[PFUser currentUser]];
    NSArray *eventObjects = [eventsQuery findObjects];
    if (eventObjects) {
        for (WorkoutEvent *event in eventObjects) {
            NSString *eventDateString = [self.dateFormatter stringFromDate:event.dateOfWorkout];
            [self.datesArray addObject:eventDateString];
            }
        }
    self.eventFromDate = (NSMutableArray *) eventObjects;
    [self.tableView reloadData];
    [self.calendar reloadData];
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
    NSString *selectedDateString = [self.dateFormatter stringFromDate:self.calendar.selectedDate];
    if ([self.datesArray containsObject:selectedDateString]){
        for (WorkoutEvent *event in self.eventFromDate){
            NSString *eventDateString = [self.dateFormatter stringFromDate:event.dateOfWorkout];
            if ([self.calendar.selectedDate compare:event.dateOfWorkout] == NSOrderedAscending){
                self.objectId = event.objectId;
                cell.eventDateLabel.text = eventDateString;
                cell.didFinishWorkoutSwitch.hidden = NO;
                cell.didFinishWorkoutLabel.text = @"Did you finish your workout?";
                cell.eventWorkoutLabel.text = [NSString stringWithFormat:@"Todays workout will consist of running %@ meters at %@", event.workout, event.timeOfDay];
                cell.didFinishWorkoutSwitch.on = event.didFinishWorkout;
                [cell.didFinishWorkoutSwitch addTarget:self action:@selector(didTapSwitch:) forControlEvents:UIControlEventValueChanged];
                return cell;
            }
        }
        
    } else {
        cell.eventDateLabel.text = nil;
        cell.didFinishWorkoutSwitch.hidden = YES;
        cell.eventWorkoutLabel.text = @"There is no event for today. Enjoy your rest day!";
        cell.didFinishWorkoutLabel.text = nil;
    }
    [self.datesArray removeAllObjects];
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
