//
//  RequestForProposalViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/28/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "RequestForProposalViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "AppDelegate.h"

@interface RequestForProposalViewController ()

@end

@implementation RequestForProposalViewController
@synthesize scrollView;

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
}

- (void)configureView {
    
    [self.scrollView contentSizeToFit];
    
    if (self.detailItem) {
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setScrollView:nil];
    
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:0.04 green:0.31 blue:0.53 alpha:1]];
    [[UITextView appearance] setTintColor:[UIColor colorWithRed:0.04 green:0.31 blue:0.53 alpha:1]];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSArray *count = @[@"10-40",@"41-100",@"101-200",@"201-300",@"300+"];
    
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsOnlyRooms){
        _roomBlockFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
    }
    
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsOnlyCatering){
        _cateringServiceFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
        _eventOrMeetingSpaceFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
    }
    
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsRoomsAndCatering){
        _roomBlockFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
        _eventOrMeetingSpaceFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
        _cateringServiceFor.text = [NSString stringWithFormat:@"%@ Guests",count[appDelegate.IDMPartySize]];
    }
    
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

@end
