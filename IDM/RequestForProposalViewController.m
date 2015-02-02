//
//  RequestForProposalViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/28/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "RequestForProposalViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "AppDelegate.h"

@interface RequestForProposalViewController ()

@end

@implementation RequestForProposalViewController
@synthesize scrollView;

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
}

- (void)configureView {
    
    [self.scrollView contentSizeToFit];
    
    if (self.detailItem) {
        
    }
    
}



-(void)updateDate:(UIDatePicker *)sender
{
    JVFloatLabeledTextField *field = (JVFloatLabeledTextField *)[self.view viewWithTag:sender.tag];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM d, yyyy"];
    field.text = [dateFormat stringFromDate:[sender date]];
}


- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    [self updateDate:self.datePicker];

}


- (BOOL)textFieldShouldBeginEditing:(JVFloatLabeledTextField *)textField {
    
    //build our custom popover view
    CGRect pickerFrame = CGRectMake(0, 0, 320, 216);
    UIView *view = [[UIView alloc] initWithFrame:pickerFrame];
    UIDatePicker *pView = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    
    pView.datePickerMode = UIDatePickerModeDate;
    self.datePicker = pView;

    NSDate *date = [NSDate date];
    
    if (![textField.text isEqualToString:@""]){
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MMMM d, yyyy"];
        NSDate *currentDate = [dateFormat dateFromString:textField.text];
        self.datePicker.date = currentDate;
    }
    
    self.datePicker.minimumDate = date;
    self.datePicker.maximumDate = [date dateByAddingTimeInterval: (365 * 3) * 86400];
    [view addSubview:self.datePicker];
    
    self.datePicker.tag = textField.tag;

    [self.datePicker addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
    
    UIViewController *popoverContent = [[UIViewController alloc]init];
    popoverContent.view = view;
    
    popoverContent.preferredContentSize = CGSizeMake(320, 216);
    
    if (self.pcDatePicker){
        [self.pcDatePicker dismissPopoverAnimated:NO];
        self.pcDatePicker = nil;
    }
    
    UIPopoverController *popoverControllerForDate = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverControllerForDate.delegate = self;
    
    NSLog(@"%f x %f",textField.frame.origin.x, textField.frame.origin.y);
    
    
    CGRect tooltip = [textField.superview convertRect:textField.frame toView:nil];

    
    [popoverControllerForDate presentPopoverFromRect:tooltip
                                              inView:self.view
                            permittedArrowDirections:UIPopoverArrowDirectionDown
                                            animated:YES];
    
    self.pcDatePicker = popoverControllerForDate;
    
    return NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setScrollView:nil];
    
    
    [self.notes setPlaceholder:@"Notes"];
    
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:0.04 green:0.31 blue:0.53 alpha:1]];
    [[UITextView appearance] setTintColor:[UIColor colorWithRed:0.04 green:0.31 blue:0.53 alpha:1]];
    
    self.startDate.tag = 91001;
    self.endDate.tag = 91002;
    
    self.startDate.delegate = self;
    self.endDate.delegate = self;
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSArray *count = @[@"10-40",@"41-100",@"101-200",@"201-300",@"300+"];
    
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsOnlyRooms){
        _roomBlockFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
    }
    
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsOnlyCatering){
        _cateringServiceFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
        _eventOrMeetingSpaceFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
    }
    
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsRoomsAndCatering){
        _roomBlockFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
        _eventOrMeetingSpaceFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
        _cateringServiceFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
