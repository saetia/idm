//
//  PartyTypeViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/24/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "PartyTypeViewController.h"
#import "AppDelegate.h"

@interface PartyTypeViewController ()

@end

@implementation PartyTypeViewController

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

- (IBAction)chooseCorporate:(UIButton *)sender {
    [self resetColors];
    [self.corporateButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartyType = IDMPartyTypeCorporate;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedGroupType" sender:self];
}

- (IBAction)chooseWedding:(UIButton *)sender {
    [self resetColors];
    [self.weddingButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartyType = IDMPartyTypeWedding;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedGroupType" sender:self];
}

- (IBAction)chooseSocial:(UIButton *)sender {
    [self resetColors];
    [self.socialButton setTitleColor:[UIColor colorWithRed:0.82 green:0.67 blue:0.31 alpha:1] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.IDMPartyType = IDMPartyTypeSocial;
    [_nextButton setEnabled:YES];
    [self performSegueWithIdentifier:@"pickedGroupType" sender:self];
}



- (void)resetColors {
    
    [self.corporateButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    
    [self.weddingButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    
    [self.socialButton setTitleColor:[UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1] forState:UIControlStateNormal];
    
}



@end
