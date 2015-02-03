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
#import "Underscore.h"
#define _ Underscore

@interface RequestForProposalViewController ()
    @property (strong, nonatomic) NSArray *currentPickerData;
    @property (strong, nonatomic) UITextField *currentPickerTextField;
@end

@implementation RequestForProposalViewController
@synthesize scrollView;





- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setScrollView:nil];
    
    self.pickerData = @[
                        @[@"", @"Morning", @"Afternoon", @"Evening"],
                        @[@"", @"$250 – $750", @"$750 – $1500", @"$1,500 – $3,000", @"$3,000+"],
                        @[@"", @"Under $100", @"$100 – $150", @"$150 – $200", @"200+"],
                        @[@"", @"10–40 Guests", @"41–100 Guests", @"101–200 Guests", @"201–300 Guests", @"300+ Guests"]
                        ];
    
    [self.notes setPlaceholder:@"Notes"];
    
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:0.04 green:0.31 blue:0.53 alpha:1]];
    [[UITextView appearance] setTintColor:[UIColor colorWithRed:0.04 green:0.31 blue:0.53 alpha:1]];
    
    self.startDate.tag = 91001;
    self.endDate.tag = 91002;
    
    //date pickers
    self.startDate.delegate = self;
    self.endDate.delegate = self;
    
    //pickers
    self.eventTime.delegate = self;
    self.eventBudget.delegate = self;
    self.eventBudget.delegate = self;
    self.roomRateRange.delegate = self;
    self.roomBlockFor.delegate = self;
    self.eventOrMeetingSpaceFor.delegate = self;
    self.cateringServiceFor.delegate = self;
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsOnlyRooms){
        _roomBlockFor.text = self.pickerData[3][appDelegate.IDMPartySize];
    }
    
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsOnlyCatering){
        _cateringServiceFor.text = self.pickerData[3][appDelegate.IDMPartySize];
        _eventOrMeetingSpaceFor.text = self.pickerData[3][appDelegate.IDMPartySize];
    }
    
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsRoomsAndCatering){
        _roomBlockFor.text = self.pickerData[3][appDelegate.IDMPartySize];
        _eventOrMeetingSpaceFor.text = self.pickerData[3][appDelegate.IDMPartySize];
        _cateringServiceFor.text = self.pickerData[3][appDelegate.IDMPartySize];
    }
    
}



- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
}

- (void)configureView {
    [self.scrollView contentSizeToFit];
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
    if (popoverController.contentViewController.view.tag == 8001){
        [self updateDate:self.datePicker];
    }
}



- (void)showDatePickerPopover:(JVFloatLabeledTextField *)textField {

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
    
    if (self.popover){
        [self.popover dismissPopoverAnimated:NO];
        self.popover = nil;
    }
    
    UIPopoverController *popoverControllerForDate = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverControllerForDate.delegate = self;
    
    CGRect tooltip = [textField.superview convertRect:textField.frame toView:nil];
    
    [popoverControllerForDate presentPopoverFromRect:tooltip
                                              inView:self.view
                            permittedArrowDirections:UIPopoverArrowDirectionDown
                                            animated:YES];
    self.popover.contentViewController.view.tag = 8001;
    self.popover = popoverControllerForDate;
    
}




- (void)showPickerPopover:(JVFloatLabeledTextField *)textField {

    CGRect pickerFrame = CGRectMake(0, 0, 320, 216);
    UIView *view = [[UIView alloc] initWithFrame:pickerFrame];
    UIPickerView *pView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    
    self.picker = pView;
    self.picker.delegate = self;
    
    if ([textField.placeholder isEqualToString:@"Event Time…"]){
        self.currentPickerData = self.pickerData[0];
    }
    if ([textField.placeholder isEqualToString:@"Event Budget…"]){
        self.currentPickerData = self.pickerData[1];
    }
    if ([textField.placeholder isEqualToString:@"Room Rate Range…"]){
        self.currentPickerData = self.pickerData[2];
    }
    if ([textField isEqual:self.roomBlockFor] || [textField isEqual:self.eventOrMeetingSpaceFor] || [textField isEqual:self.cateringServiceFor]){
        self.currentPickerData = self.pickerData[3];
    }

    self.currentPickerTextField = textField;
    
    NSUInteger index = _.indexOf(self.currentPickerData, textField.text);
    [self.picker selectRow:index inComponent:0 animated:NO];

    
    
    [view addSubview:self.picker];

    UIViewController *popoverContent = [[UIViewController alloc]init];
    popoverContent.view = view;
    
    popoverContent.preferredContentSize = CGSizeMake(320, 216);
    
    if (self.popover){
        [self.popover dismissPopoverAnimated:NO];
        self.popover = nil;
    }
    
    UIPopoverController *popoverControllerForDate = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverControllerForDate.delegate = self;
    
    CGRect tooltip = [textField.superview convertRect:textField.frame toView:nil];
    
    [popoverControllerForDate presentPopoverFromRect:tooltip
                                              inView:self.view
                            permittedArrowDirections:UIPopoverArrowDirectionDown
                                            animated:YES];
    
    self.popover.contentViewController.view.tag = 8002;
    self.popover = popoverControllerForDate;
    
}


- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.currentPickerData count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.currentPickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    self.currentPickerTextField.text = self.currentPickerData[row];
    
}


- (void)resignFirstResponders {
    [self.clientName resignFirstResponder];
    [self.companyName resignFirstResponder];
    [self.email resignFirstResponder];
    [self.phone resignFirstResponder];
    [self.eventName resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(JVFloatLabeledTextField *)textField {
  
    [self resignFirstResponders];
    
    if ([textField.placeholder isEqualToString:@"Start Date…"] || [textField.placeholder isEqualToString:@"End Date…"]){
        
        [self showDatePickerPopover:textField];
    } else {
        [self showPickerPopover:textField];
    }
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
}

@end
