//
//  RequestForProposalViewController.h
//  IDM
//
//  Created by Joel Glovacki on 10/28/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPKeyboardAvoidingScrollView;
@interface RequestForProposalViewController : UIViewController
@property (strong, nonatomic) id detailItem;
@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@end