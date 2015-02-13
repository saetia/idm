//
//  PropertyDetailViewController.h
//  IDM
//
//  Created by Joel Glovacki on 10/15/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PropertyViewController.h"

@interface PropertyDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *web;
@property (strong, nonatomic) id detailItem;
@property BOOL shouldPreventRFP;
@property (weak, nonatomic) IBOutlet UIButton *requestForProposalButton;
@end
