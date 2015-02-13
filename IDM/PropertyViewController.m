//
//  PropertyViewController.m
//  IDM
//
//  Created by Joel Glovacki on 2/13/15.
//  Copyright (c) 2015 Company B. All rights reserved.
//

#import "PropertyViewController.h"

@interface PropertyViewController ()


@end

@implementation PropertyViewController

+ (void)initialize {
//    UIPageControl *pageControl = UIPageControl.appearance;
//    pageControl.pageIndicatorTintColor = UIColor.blackColor;
//    pageControl.currentPageIndicatorTintColor = UIColor.redColor;
}

- (NSArray *)pageIdentifiers {
    return @[@"secondary", @"secondary", @"secondary", @"secondary", @"secondary"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    

}

- (void)setUpViewController:(PropertyViewSecondaryPage *)page
                    atIndex:(NSInteger)index  {
    
    NSString *html = [NSString stringWithFormat:@"<img src=\"%@\" style=\"width:100%%;\">", [[self.detailItem valueForKey:@"header_image"] description]];
    
    page.webData = @{@"content": html};
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
