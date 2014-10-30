//
//  RequestForProposalViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/28/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "RequestForProposalViewController.h"
#import "TPKeyboardAvoidingScrollView.h"

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
    
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setScrollView:nil];
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
