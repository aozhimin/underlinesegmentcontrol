//
//  ViewController.m
//  underlinesegmentcontrol
//
//  Created by 敖志敏 on 15/8/14.
//  Copyright (c) 2015年 敖志敏. All rights reserved.
//

#import "ViewController.h"
#import "UnderlineSegmentControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UnderlineSegmentControl *segmentControl = [[UnderlineSegmentControl alloc] initWithFrame:CGRectMake(0, 44, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight(self.view.frame))];
    
    NSArray *arrayTitle = @[@"门票", @"酒店", @"度假"];
    [segmentControl AddSegumentArray:arrayTitle];
    
    segmentControl.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:0.7];
    
    segmentControl.titleColor = [UIColor blackColor];
    
    segmentControl.selectColor = [UIColor purpleColor];
    
    segmentControl.selectUnderlineColor = [UIColor purpleColor];
    
    segmentControl.titleFont = [UIFont fontWithName:@".Helvetica Neue Interface" size:14.0f];
    
    [segmentControl selectTheSegument:1];
    
    [self.view addSubview:segmentControl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
