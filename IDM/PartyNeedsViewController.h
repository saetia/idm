//
//  PartyNeedsViewController.h
//  IDM
//
//  Created by Joel Glovacki on 10/24/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartyNeedsViewController : UIViewController
- (IBAction)chooseRooms:(UIButton *)sender;
- (IBAction)chooseCatering:(UIButton *)sender;
- (IBAction)chooseRoomsAndCatering:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *onlyRoomsButton;
@property (weak, nonatomic) IBOutlet UIButton *onlyCateringButton;
@property (weak, nonatomic) IBOutlet UIButton *roomsAndCateringButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end
