//
//  UnderlineSegmentControl.h
//  underlinesegmentcontrol
//
//  Created by 敖志敏 on 15/8/14.
//  Copyright (c) 2015年 敖志敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UnderlineSegmentControlDelegate< NSObject>
@optional
-(void)segmentSelectionChange:(NSInteger)selection;
@end


@interface UnderlineSegmentControl : UIView

@property(nonatomic,strong)id <UnderlineSegmentControlDelegate>delegate;
@property(nonatomic,strong)NSMutableArray* ButtonArray;
@property(strong,nonatomic)UIColor* titleColor;
@property(strong,nonatomic)UIColor* selectColor;
@property(strong,nonatomic)UIColor* selectUnderlineColor;
@property(strong,nonatomic)UIFont* titleFont;
//@property(strong,nonatomic) UIView *viewUnderline;


-(void)AddSegumentArray:(NSArray *)SegumentArray;
-(instancetype)initWithFrame:(CGRect)frame;
-(void)selectTheSegument:(NSInteger)segument;
@end
