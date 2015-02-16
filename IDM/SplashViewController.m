//
//  SplashViewController.m
//  IDM
//
//  Created by Joel Glovacki on 2/13/15.
//  Copyright (c) 2015 Company B. All rights reserved.
//

#import "SplashViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SplashViewController ()

@end

@implementation SplashViewController



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







- (void)viewDidLoad
{
    [super viewDidLoad];
    self.kenView.layer.borderWidth = 0;
    self.kenView.layer.borderColor = [UIColor colorWithRed:0.03 green:0.31 blue:0.55 alpha:1].CGColor;
    self.kenView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSArray *myImages = @[[UIImage imageNamed:@"image1.jpg"],
                          [UIImage imageNamed:@"image2.jpg"],
                          [UIImage imageNamed:@"image3.jpg"],
                          [UIImage imageNamed:@"image4.jpg"],
                          [UIImage imageNamed:@"image5.jpg"],
                          [UIImage imageNamed:@"image6.jpg"],
                          [UIImage imageNamed:@"image7.jpg"],
                          [UIImage imageNamed:@"image8.jpg"],
                          [UIImage imageNamed:@"image9.jpg"],
                          [UIImage imageNamed:@"image10.jpg"],
                          [UIImage imageNamed:@"image11.jpg"],
                          [UIImage imageNamed:@"image12.jpg"],
                          [UIImage imageNamed:@"image13.jpg"],
                          [UIImage imageNamed:@"image14.jpg"],
                          [UIImage imageNamed:@"image15.jpg"],
                          [UIImage imageNamed:@"image16.jpg"],
                          [UIImage imageNamed:@"image17.jpg"],
                          [UIImage imageNamed:@"image18.jpg"],
                          [UIImage imageNamed:@"image19.jpg"],
                          [UIImage imageNamed:@"image20.jpg"],
                          [UIImage imageNamed:@"image21.jpg"],
                          [UIImage imageNamed:@"image22.jpg"],
                          [UIImage imageNamed:@"image23.jpg"],
                          [UIImage imageNamed:@"image24.jpg"],
                          [UIImage imageNamed:@"image25.jpg"],
                          ];
    
    [self.kenView animateWithImages:myImages
                 transitionDuration:10
                       initialDelay:0
                               loop:YES
                        isLandscape:YES];
    
}

- (void)viewDidUnload
{
    [self.kenView stopAnimation];
    [self setKenView:nil];
    [super viewDidUnload];
}


#pragma mark - KenBurnsViewDelegate

- (void)kenBurns:(JBKenBurnsView *)kenBurns didShowImage:(UIImage *)image atIndex:(NSUInteger)index
{
   
}

- (void)kenBurns:(JBKenBurnsView *)kenBurns didFinishAllImages:(NSArray *)images
{
   
}

@end


