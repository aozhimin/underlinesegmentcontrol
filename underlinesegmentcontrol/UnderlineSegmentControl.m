//
//  UnderlineSegmentControl.m
//  underlinesegmentcontrol
//
//  Created by 敖志敏 on 15/8/14.
//  Copyright (c) 2015年 敖志敏. All rights reserved.
//

#import "UnderlineSegmentControl.h"


@interface UnderlineSegmentControl ()<UnderlineSegmentControlDelegate>
{
    CGFloat witdFloat;
    UIView* viewUnderline;
    NSInteger selectSeugment;
}

@end


@implementation UnderlineSegmentControl

@synthesize selectUnderlineColor = _selectUnderlineColor;

- (UIColor *)selectUnderlineColor{
    if (!_selectUnderlineColor) {
        _selectUnderlineColor = [UIColor redColor];
    }
    return _selectUnderlineColor;
}

- (void)setSelectUnderlineColor:(UIColor *)selectUnderlineColor{
    _selectUnderlineColor = selectUnderlineColor;
    viewUnderline.backgroundColor = selectUnderlineColor;
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    [self.ButtonArray enumerateObjectsUsingBlock:^(id button, NSUInteger idx, BOOL *stop) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }];
}

- (void)setSelectColor:(UIColor *)selectColor{
    _selectColor = selectColor;
    [self.ButtonArray enumerateObjectsUsingBlock:^(id button, NSUInteger idx, BOOL *stop) {
        [button setTitleColor:selectColor forState:UIControlStateSelected];
    }];
}
-(void)AddSegumentArray:(NSArray *)SegumentArray
{
    NSInteger seugemtNumber=SegumentArray.count;
    witdFloat=(self.bounds.size.width)/seugemtNumber;
    for (int i=0; i<SegumentArray.count; i++) {
        UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(i*witdFloat, 0, witdFloat, self.bounds.size.height-2)];
        [button setTitle:SegumentArray[i] forState:UIControlStateNormal];
        //        NSLog(@"这里defont%@",[button.titleLabel.font familyName]);
        [button.titleLabel setFont:self.titleFont];
        [button setTitleColor:self.titleColor forState:UIControlStateNormal];
        [button setTitleColor:self.selectColor forState:UIControlStateSelected];
        [button setTag:i];
        [button addTarget:self action:@selector(changeTheSegument:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            viewUnderline = [[UIView alloc]initWithFrame:CGRectMake(i*witdFloat, self.bounds.size.height-2, witdFloat, 2)];
            [viewUnderline setBackgroundColor:self.selectUnderlineColor];
            [self addSubview:viewUnderline];
        }
        [self addSubview:button];
        [self.ButtonArray addObject:button];
    }
    [[self.ButtonArray firstObject] setSelected:YES];
}
-(void)changeTheSegument:(UIButton*)button
{
    [self selectTheSegument:button.tag];
    
}
-(void)selectTheSegument:(NSInteger)segument
{
    if (selectSeugment!=segument) {
        NSLog(@"我点击了");
        [self.ButtonArray[selectSeugment] setSelected:NO];
        [self.ButtonArray[segument] setSelected:YES];
        [UIView animateWithDuration:0.5 animations:^{
            [viewUnderline setFrame:CGRectMake(segument*witdFloat,self.bounds.size.height-2, witdFloat, 2)];
        }];
        selectSeugment=segument;
        [self.delegate segmentSelectionChange:selectSeugment];
    }
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self.ButtonArray=[NSMutableArray array];
    selectSeugment=0;
    self.titleFont=[UIFont fontWithName:@".Helvetica Neue Interface" size:14.0f];
    self=[super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 34)];
    self.backgroundColor = [UIColor colorWithRed:253.0f/255 green:239.0f/255 blue:230.0f/255 alpha:1.0f];
    self.titleColor=[UIColor colorWithRed:77.0/255 green:77.0/255 blue:77.0/255 alpha:1.0f];
    self.selectColor=[UIColor colorWithRed:233.0/255 green:97.0/255 blue:31.0/255 alpha:1.0f];
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
