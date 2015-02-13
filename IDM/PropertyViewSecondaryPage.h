//
//  PropertyViewSecondaryPage.h
//  IDM
//
//  Created by Joel Glovacki on 2/13/15.
//  Copyright (c) 2015 Company B. All rights reserved.
//

#import "MSPageViewControllerPage.h"

@interface PropertyViewSecondaryPage : MSPageViewControllerPage
@property (weak, nonatomic) IBOutlet UIWebView *web;
@property (strong, nonatomic) NSDictionary *webData;
@property BOOL offsetSet;
@end
