//
//  SplashViewController.h
//  IDM
//
//  Created by Joel Glovacki on 2/13/15.
//  Copyright (c) 2015 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBKenBurnsView.h"

@interface SplashViewController : UIViewController <KenBurnsViewDelegate>

@property (nonatomic, strong) IBOutlet JBKenBurnsView *kenView;

@end
