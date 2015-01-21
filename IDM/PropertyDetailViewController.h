//
//  PropertyDetailViewController.h
//  IDM
//
//  Created by Joel Glovacki on 10/15/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property BOOL shouldPreventRFP;
@property (weak, nonatomic) IBOutlet UILabel *propertyName;
@property (weak, nonatomic) IBOutlet UIImageView *propertyHeaderImage;
@property (weak, nonatomic) IBOutlet UIWebView *propertyBody;
@property (weak, nonatomic) IBOutlet UIButton *requestForProposalButton;
@end
