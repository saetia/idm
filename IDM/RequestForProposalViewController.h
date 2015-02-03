//
//  RequestForProposalViewController.h
//  IDM
//
//  Created by Joel Glovacki on 10/28/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"
#import "JVFloatLabeledTextView.h"

@class TPKeyboardAvoidingScrollView;
@interface RequestForProposalViewController : UIViewController <UIPopoverControllerDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) id detailItem;
@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;


@property (strong, nonatomic) NSArray *pickerData;

@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *clientName;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *companyName;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *email;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *phone;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *eventName;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *eventTime;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *eventBudget;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *roomRateRange;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *startDate;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *endDate;
@property (weak, nonatomic) IBOutlet UISwitch *flexibleDates;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *roomBlockFor;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *eventOrMeetingSpaceFor;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *cateringServiceFor;
@property (weak, nonatomic) IBOutlet UISwitch *avNeeded;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *notes;
@property (weak, nonatomic) IBOutlet UIButton *sendYourRequest;
@property (strong, nonatomic) UIPopoverController *popover;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIPickerView *picker;
@end
