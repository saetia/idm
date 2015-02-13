//
//  PropertyDetailViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/15/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "PropertyDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface PropertyDetailViewController ()

@end

@implementation PropertyDetailViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
}


- (void)configureView {
    
    if (self.shouldPreventRFP){
        [self.requestForProposalButton setAlpha:0];
        [self.requestForProposalButton setUserInteractionEnabled:NO];
    }
    
    if (self.detailItem) {
  
        self.web.scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        self.web.scrollView.pagingEnabled = YES;
        [self.web loadHTMLString: [[self.detailItem valueForKey:@"body"] description] baseURL:nil];
        
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLoad {
    
    self.title=@" ";
    
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
