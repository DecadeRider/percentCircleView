//
//  JackPercentView.h
//  percentCircleView
//
//  Created by 中投德利 on 2018/6/4.
//  Copyright © 2018年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JackPercentView : UIView
//要显示的百分比的数组
@property (nonatomic, copy) NSArray *circleArray;
//线条宽度
@property (nonatomic, assign) CGFloat lineWidth;


@end
