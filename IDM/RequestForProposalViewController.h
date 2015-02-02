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
@interface RequestForProposalViewController : UIViewController <UIPopoverControllerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) id detailItem;
@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *roomBlockFor;
@property (weak, nonatomic) IBOutlet UITextField *eventOrMeetingSpaceFor;
@property (weak, nonatomic) IBOutlet UITextField *cateringServiceFor;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *startDate;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *endDate;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *notes;
@property (strong, nonatomic) UIPopoverController *pcDatePicker;
@property (strong, nonatomic) UIDatePicker *datePicker;
@end
