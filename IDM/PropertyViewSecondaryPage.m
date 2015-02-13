//
//  PropertyViewSecondaryPage.m
//  IDM
//
//  Created by Joel Glovacki on 2/13/15.
//  Copyright (c) 2015 Company B. All rights reserved.
//

#import "PropertyViewSecondaryPage.h"

@interface PropertyViewSecondaryPage ()

@end

@implementation PropertyViewSecondaryPage

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor redColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self.web.scrollView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.web.scrollView setScrollIndicatorInsets:UIEdgeInsetsMake(-64, 0, 0, 0)];
    [self.web.scrollView scrollRectToVisible:CGRectMake(100, 100, 100, 100) animated:NO];
    
    self.view.backgroundColor = [UIColor greenColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSString *html = [NSString stringWithFormat:@"<html>"
    "<head>"
    "   <style>"
    "       body {"
    "           margin:0;"
    "           color:#0a4e8c; background:red;"
    "           font-family:\"Myriad Pro\", Arial, Helvetica, sans-serif;"
    "           font-size:16px;"
    "       }"
    "       section {width:100%%; display:block;}"
    "       section div {width:50%%; float:left;}"
    "       section strong {display:block; margin:20px 0 0;}"
    "       p {margin-top:6px;}"
    "       h3 {"
    "           font-size:27px;"
    "           padding:62px 0 0;"
    "           margin:0;"
    "           clear:both;"
    "       }"
    "   </style>"
    "</head>"
    "<body>%@</body>"
    "</html>",
                      
                      
    self.webData[@"content"]];

    self.web.scrollView.bounces = NO;
    
    [self.web loadHTMLString:html baseURL:nil];
    
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
