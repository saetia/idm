//
//  PartySizeViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/24/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "PartySizeViewController.h"
#import "AppDelegate.h"
@interface PartySizeViewController ()

@end

@implementation PartySizeViewController

- (void)viewDidLoad {
    self.title=@" ";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_nextButton setEnabled:NO];
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

- (IBAction)chooseTen:(UIButton *)sender {
    [self resetColors];
    [self.tenButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartySize = IDMPartySizeTen;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedGroupSize" sender:self];
}

- (IBAction)chooseForty:(UIButton *)sender {
    [self resetColors];
    [self.fortyButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartySize = IDMPartySizeForty;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedGroupSize" sender:self];
}

- (IBAction)chooseOneHundred:(UIButton *)sender {
    [self resetColors];
    [self.oneHundredButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartySize = IDMPartySizeOneHundred;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedGroupSize" sender:self];
}

- (IBAction)chooseTwoHundred:(UIButton *)sender {
    [self resetColors];
    [self.twoHundredButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartySize = IDMPartySizeTwoHundred;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedGroupSize" sender:self];
}

- (IBAction)chooseThreeHundred:(UIButton *)sender {
    [self resetColors];
    [self.threeHundredButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartySize = IDMPartySizeThreeHundred;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedGroupSize" sender:self];
}


- (void)resetColors {
    [self.tenButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    [self.fortyButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    [self.oneHundredButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    [self.twoHundredButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    [self.threeHundredButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
}

@end
