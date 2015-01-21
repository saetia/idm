//
//  PropertyDetailViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/15/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "PropertyDetailViewController.h"

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
    
    //NSLog(@"loaded %@",[self.detailItem valueForKey:@"name"]);
   
    if (self.shouldPreventRFP){
        [self.requestForProposalButton setAlpha:0];
    }
    
    if (self.detailItem) {
        
        self.propertyName.text = [[self.detailItem valueForKey:@"name"] description];
        
        self.propertyHeaderImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@ Photo.jpg", [[self.detailItem valueForKey:@"name"] description]]];
        
        NSString *html = [NSString stringWithFormat:@"<html>"
                                                    "<head>"
                                                    "   <style>"
                                                    "       body {"
                                                    "           margin:37px 92px 65px;"
                                                    "           color:#0a4e8c;"
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
                                                    "<body>"
                                                    "   <section>"
                                                    "       <div><strong>Location</strong>%@<strong>Number of Rooms</strong>%@<strong>Food & Beverage</strong>%@</div>"
                                                    "       <div><strong>Website</strong>%@<strong>Meeting Space</strong>%@</div>"
                                                    "   </section>"
                                                    "   %@"
                                                    "</body>"
                                                    "</html>",
                          
                                                    [[self.detailItem valueForKey:@"location"] description],
                                                    [[self.detailItem valueForKey:@"rooms"] description],
                                                    [[self.detailItem valueForKey:@"food"] description],
                                                    [[self.detailItem valueForKey:@"website"] description],
                                                    [[self.detailItem valueForKey:@"meeting_sqft"] description],
                                                    [[self.detailItem valueForKey:@"body"] description]
                          ];
        
        [self.propertyBody loadHTMLString: html baseURL:nil];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
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
