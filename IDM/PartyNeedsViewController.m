//
//  PartyNeedsViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/24/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "PartyNeedsViewController.h"
#import "AppDelegate.h"

@interface PartyNeedsViewController ()

@end

@implementation PartyNeedsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CATransition *transition = [CATransition animation];
//    transition.duration = 0.5;
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromBottom;
//    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    [_nextButton.layer addAnimation:transition forKey:nil];
    
    
    [_nextButton setEnabled:NO];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)chooseRooms:(UIButton *)sender {
    [self resetColors];
    [self.onlyRoomsButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartyNeeds = IDMPartyNeedsOnlyRooms;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedAccomodations" sender:self];
}

- (IBAction)chooseCatering:(UIButton *)sender {
    [self resetColors];
    [self.onlyCateringButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartyNeeds = IDMPartyNeedsOnlyCatering;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedAccomodations" sender:self];
}

- (IBAction)chooseRoomsAndCatering:(UIButton *)sender {
    [self resetColors];
    [self.roomsAndCateringButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartyNeeds = IDMPartyNeedsRoomsAndCatering;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedAccomodations" sender:self];
}


- (void)resetColors {
    [self.onlyRoomsButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    [self.roomsAndCateringButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    [self.onlyCateringButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
}

@end
