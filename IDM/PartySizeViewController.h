//
//  PartySizeViewController.h
//  IDM
//
//  Created by Joel Glovacki on 10/24/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartySizeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *tenButton;
@property (weak, nonatomic) IBOutlet UIButton *fortyButton;
@property (weak, nonatomic) IBOutlet UIButton *oneHundredButton;
@property (weak, nonatomic) IBOutlet UIButton *twoHundredButton;
@property (weak, nonatomic) IBOutlet UIButton *threeHundredButton;
- (IBAction)chooseTen:(UIButton *)sender;
- (IBAction)chooseForty:(UIButton *)sender;
- (IBAction)chooseOneHundred:(UIButton *)sender;
- (IBAction)chooseTwoHundred:(UIButton *)sender;
- (IBAction)chooseThreeHundred:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end
