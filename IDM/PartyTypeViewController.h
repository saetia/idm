//
//  PartyTypeViewController.h
//  IDM
//
//  Created by Joel Glovacki on 10/24/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartyTypeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *corporateButton;
@property (weak, nonatomic) IBOutlet UIButton *weddingButton;
@property (weak, nonatomic) IBOutlet UIButton *socialButton;
- (IBAction)chooseCorporate:(UIButton *)sender;
- (IBAction)chooseWedding:(UIButton *)sender;
- (IBAction)chooseSocial:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end
