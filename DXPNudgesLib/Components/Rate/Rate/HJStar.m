//
//  QCStarView.m
//  QCStarView
//
//  Created by EricZhang on 2018/8/15.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "HJStar.h"
#import "UIImage+SVGManager.h"
#import "Nudges.h"

#define DEFALUT_STAR_NUMBER 5 // 星星的个数
#define ANIMATION_TIME_INTERVAL 0.1

/*
 实现思路
 先放背景图
 再放前景图
 前景图在上背景图在下
 然后根据比例显示前景图
 */
@interface HJStar()
// 星星个数
@property (nonatomic, assign) NSInteger numberOfStars;
// 星星个数数组
@property (nonatomic, strong) NSMutableArray *starList;
@end

@implementation HJStar

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
//        [self initDataAndCreateUI];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _numberOfStars = DEFALUT_STAR_NUMBER;
//        [self initDataAndCreateUI];
    }
    return self;
}

- (void)setViewWidth:(CGFloat)viewWidth {
    _viewWidth = viewWidth;
    [self initDataAndCreateUI];
}

- (void)setIconSize:(CGFloat)iconSize {
    _iconSize = iconSize;
}

- (void)setSvgName:(NSString *)svgName {
    _svgName = svgName;
}

// 初始化数据and创建视图
- (void)initDataAndCreateUI {
    
    self.starList = [[NSMutableArray alloc] init];
    
    [self createStarViewWithImage:@""];
    
    _scorePercent = 1;//默认为1
    _isAnimation = NO;//默认为NO
    _isCompleteStar = NO;//默认为NO
    _isJsutDisplay = NO;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self]; // 手指当前点
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.viewWidth / self.numberOfStars);
    CGFloat starScore = self.isCompleteStar ?  ceilf(realStarScore):realStarScore ;
    
    if (_isJsutDisplay) {
        //数据不发生变化，界面也就不刷新
        return;
    } else {
        self.scorePercent = starScore / self.numberOfStars;
        if (self.sendStarPercent) {
            self.sendStarPercent(self.scorePercent);
        }
    }
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++) {
        NSString *svgName = isEmptyString_Nd(self.svgName)?@"icon_star": self.svgName;
        UIImageView *imgView = [UIImageView new];
        CGFloat space = ((_viewWidth - 10 * 2) - (self.numberOfStars * self.iconSize)) / (self.numberOfStars - 1);
        imgView.frame = CGRectMake(i*self.iconSize + space * i, 10, self.iconSize, self.iconSize);
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imgView];
        [imgView setImage:[UIImage svgImageNamed:svgName size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.beforeSvgColor)?@"#333333":self.beforeSvgColor]];
        [self.starList addObject:imgView];
    }
    return view;
}

//MARK: 建议使用setNeedsLayout  可以和变化数据同步使用（eg:下边的set方法）  只要数据变化 layoutSubviews 就会被调用，而addsubview一般只调用一次
- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak HJStar *weakSelf = self;
    CGFloat animationTimeInterval = self.isAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        NSLog(@"%f",weakSelf.scorePercent);
        for (NSInteger i = 0; i < self.numberOfStars; i ++) {
            NSString *svgName = isEmptyString_Nd(self.svgName)?@"icon_star": self.svgName;
            UIImageView *imgView  = [self.starList objectAtIndex:i];
            [self addSubview:imgView];
            if (i < weakSelf.scorePercent / 2 * 10) {
                [imgView setImage:[UIImage svgImageNamed:svgName size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.afterSvgColor)?@"#e24a34":self.afterSvgColor]];
            } else {
                [imgView setImage:[UIImage svgImageNamed:svgName size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.beforeSvgColor)?@"#333333":self.beforeSvgColor]];
            }
        }
    }];
}

#pragma mark - Get and Set Methods
- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    if (scroePercent < 0) {
        _scorePercent = 0;
    } else if (scroePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    [self setNeedsLayout];
}

@end
