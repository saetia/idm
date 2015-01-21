//
//  RequestForProposalViewController.h
//  IDM
//
//  Created by Joel Glovacki on 10/28/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"

@class TPKeyboardAvoidingScrollView;
@interface RequestForProposalViewController : UIViewController
@property (strong, nonatomic) id detailItem;
@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *roomBlockFor;
@property (weak, nonatomic) IBOutlet UITextField *eventOrMeetingSpaceFor;
@property (weak, nonatomic) IBOutlet UITextField *cateringServiceFor;

@end
