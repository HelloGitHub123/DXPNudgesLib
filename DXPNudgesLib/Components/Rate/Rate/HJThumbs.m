//
//  HJThumbs.m
//  DITOApp
//
//  Created by 李标 on 2022/9/17.
//

#import "HJThumbs.h"
#import "UIImage+SVGManager.h"
#import "Nudges.h"
#import <SVGKit/SVGKImage.h>

@interface HJThumbs ()

@property (nonatomic, strong) UIImageView *thumbsUpImgview; // 点赞
@property (nonatomic, strong) UIImageView *thumbsDownImgview; // 点踩
@end



@implementation HJThumbs

- (instancetype)init {
    self = [super init];
    if (self) {
       
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

// 初始化数据and创建视图
- (void)initDataAndCreateUI {
    // 2个icon区域的宽度
#define icon_space 20
    CGFloat w_iconview = self.iconSize * 2 + icon_space;
    
    [self addSubview:self.thumbsUpImgview];
    [self.thumbsUpImgview setUserInteractionEnabled:YES];
    self.thumbsUpImgview.frame = CGRectMake(_viewWidth/2 - w_iconview/2, 10, self.iconSize, self.iconSize);
    self.thumbsUpImgview.tag = 101;
//    [self.thumbsUpImgview setImage:[UIImage svgImageNamed:@"thumbs-up" size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.beforeSvgColor)?@"#333333":self.beforeSvgColor]];
	
	
	// 获取资源包的路径
	NSBundle *bundle1 = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"DXPNudgesLib" ofType:@"bundle"]];
	// 加载 SVG 文件
	NSString *svgFilePath1 = [bundle1 pathForResource:@"thumbs-up" ofType:@"svg"];
	if (svgFilePath1) {
		NSError *error = nil;
		NSString *svgContent = [NSString stringWithContentsOfFile:svgFilePath1 encoding:NSUTF8StringEncoding error:&error];
		if (error) {
			NSLog(@"DXPNugges Log:=== Error reading SVG file: %@", error.localizedDescription);
		} else {
			// 替换填充颜色
			NSString *desiredColorHex = isEmptyString_Nd(self.beforeSvgColor)?@"#333333":self.beforeSvgColor; // 你想要的颜色
			svgContent = [svgContent stringByReplacingOccurrencesOfString:@"fill=\"#000000\"" withString:[NSString stringWithFormat:@"fill=\"%@\"", desiredColorHex]];
			
			// 将修改后的内容写入临时文件
			NSString *tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp1.svg"];
			[svgContent writeToFile:tempFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
			
			// 重新加载 SVG 内容
			SVGKImage *svgImage = [SVGKImage imageWithContentsOfFile:tempFilePath];
			self.thumbsUpImgview.image = svgImage.UIImage;
		}
	}
	
	
	
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture1.numberOfTapsRequired = 1;
    [self.thumbsUpImgview addGestureRecognizer:tapGesture1];
    
    [self addSubview:self.thumbsDownImgview];
    [self.thumbsDownImgview setUserInteractionEnabled:YES];
    self.thumbsDownImgview.frame = CGRectMake(_viewWidth/2 - w_iconview/2 + self.iconSize + 10, 10, self.iconSize, self.iconSize);
    self.thumbsDownImgview.tag = 102;
//    [self.thumbsDownImgview setImage:[UIImage svgImageNamed:@"thumbs-down" size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.beforeSvgColor)?@"#333333":self.beforeSvgColor]];
	
	// 获取资源包的路径
	NSBundle *bundle2 = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"DXPNudgesLib" ofType:@"bundle"]];
	// 加载 SVG 文件
	NSString *svgFilePath2 = [bundle2 pathForResource:@"thumbs-down" ofType:@"svg"];
	if (svgFilePath2) {
		NSError *error = nil;
		NSString *svgContent = [NSString stringWithContentsOfFile:svgFilePath2 encoding:NSUTF8StringEncoding error:&error];
		if (error) {
			NSLog(@"DXPNugges Log:=== Error reading SVG file: %@", error.localizedDescription);
		} else {
			// 替换填充颜色
			NSString *desiredColorHex = isEmptyString_Nd(self.beforeSvgColor)?@"#333333":self.beforeSvgColor; // 你想要的颜色
			svgContent = [svgContent stringByReplacingOccurrencesOfString:@"fill=\"#000000\"" withString:[NSString stringWithFormat:@"fill=\"%@\"", desiredColorHex]];
			
			// 将修改后的内容写入临时文件
			NSString *tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp2.svg"];
			[svgContent writeToFile:tempFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
			
			// 重新加载 SVG 内容
			SVGKImage *svgImage = [SVGKImage imageWithContentsOfFile:tempFilePath];
			self.thumbsDownImgview.image = svgImage.UIImage;
		}
	}
	
	
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture2.numberOfTapsRequired = 1;
    [self.thumbsDownImgview addGestureRecognizer:tapGesture2];
}

- (void)userTapRateView:(UIGestureRecognizer *)tap {
    NSInteger tag = tap.view.tag;
    if (tag == 101) {
        // 选中
//        [self.thumbsUpImgview setImage:[UIImage svgImageNamed:@"thumbs-up" size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.thumbsUpColor)?@"#e24a34":self.thumbsUpColor]];
        // 未选中颜色
//        [self.thumbsDownImgview setImage:[UIImage svgImageNamed:@"thumbs-down" size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.beforeSvgColor)?@"#e24a34":self.beforeSvgColor]];
		
		
		// 获取资源包的路径
		NSBundle *bundle3 = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"DXPNudgesLib" ofType:@"bundle"]];
		// 加载 SVG 文件
		NSString *svgFilePath3 = [bundle3 pathForResource:@"thumbs-up" ofType:@"svg"];
		if (svgFilePath3) {
			NSError *error = nil;
			NSString *svgContent = [NSString stringWithContentsOfFile:svgFilePath3 encoding:NSUTF8StringEncoding error:&error];
			if (error) {
				NSLog(@"DXPNugges Log:=== Error reading SVG file: %@", error.localizedDescription);
			} else {
				// 替换填充颜色
				NSString *desiredColorHex = isEmptyString_Nd(self.thumbsUpColor)?@"#e24a34":self.thumbsUpColor; // 你想要的颜色
				svgContent = [svgContent stringByReplacingOccurrencesOfString:@"fill=\"#000000\"" withString:[NSString stringWithFormat:@"fill=\"%@\"", desiredColorHex]];
				
				// 将修改后的内容写入临时文件
				NSString *tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp7.svg"];
				[svgContent writeToFile:tempFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
				
				// 重新加载 SVG 内容
				SVGKImage *svgImage = [SVGKImage imageWithContentsOfFile:tempFilePath];
				self.thumbsUpImgview.image = svgImage.UIImage;
			}
		}
		
		// 获取资源包的路径
		NSBundle *bundle4 = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"DXPNudgesLib" ofType:@"bundle"]];
		// 加载 SVG 文件
		NSString *svgFilePath4 = [bundle4 pathForResource:@"thumbs-down" ofType:@"svg"];
		if (svgFilePath4) {
			NSError *error = nil;
			NSString *svgContent = [NSString stringWithContentsOfFile:svgFilePath4 encoding:NSUTF8StringEncoding error:&error];
			if (error) {
				NSLog(@"DXPNugges Log:=== Error reading SVG file: %@", error.localizedDescription);
			} else {
				// 替换填充颜色
				NSString *desiredColorHex = isEmptyString_Nd(self.beforeSvgColor)?@"#e24a34":self.beforeSvgColor; // 你想要的颜色
				svgContent = [svgContent stringByReplacingOccurrencesOfString:@"fill=\"#000000\"" withString:[NSString stringWithFormat:@"fill=\"%@\"", desiredColorHex]];
				
				// 将修改后的内容写入临时文件
				NSString *tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp5.svg"];
				[svgContent writeToFile:tempFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
				
				// 重新加载 SVG 内容
				SVGKImage *svgImage = [SVGKImage imageWithContentsOfFile:tempFilePath];
				self.thumbsDownImgview.image = svgImage.UIImage;
			}
		}
		
		
    }
    if (tag == 102) {
        // 未选中颜色
//        [self.thumbsUpImgview setImage:[UIImage svgImageNamed:@"thumbs-up" size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.beforeSvgColor)?@"#e24a34":self.beforeSvgColor]];
		
		// 获取资源包的路径
		NSBundle *bundle5 = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"DXPNudgesLib" ofType:@"bundle"]];
		// 加载 SVG 文件
		NSString *svgFilePath5 = [bundle5 pathForResource:@"thumbs-up" ofType:@"svg"];
		if (svgFilePath5) {
			NSError *error = nil;
			NSString *svgContent = [NSString stringWithContentsOfFile:svgFilePath5 encoding:NSUTF8StringEncoding error:&error];
			if (error) {
				NSLog(@"DXPNugges Log:=== Error reading SVG file: %@", error.localizedDescription);
			} else {
				// 替换填充颜色
				NSString *desiredColorHex = isEmptyString_Nd(self.beforeSvgColor)?@"#e24a34":self.beforeSvgColor; // 你想要的颜色
				svgContent = [svgContent stringByReplacingOccurrencesOfString:@"fill=\"#000000\"" withString:[NSString stringWithFormat:@"fill=\"%@\"", desiredColorHex]];
				
				// 将修改后的内容写入临时文件
				NSString *tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp9.svg"];
				[svgContent writeToFile:tempFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
				
				// 重新加载 SVG 内容
				SVGKImage *svgImage = [SVGKImage imageWithContentsOfFile:tempFilePath];
				self.thumbsUpImgview.image = svgImage.UIImage;
			}
		}
		
        // 选中
//        [self.thumbsDownImgview setImage:[UIImage svgImageNamed:@"thumbs-down" size:CGSizeMake(self.iconSize, self.iconSize) tintColor:isEmptyString_Nd(self.thumbsDownColor)?@"#e24a34":self.thumbsDownColor]];
		
		// 获取资源包的路径
		NSBundle *bundle6 = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"DXPNudgesLib" ofType:@"bundle"]];
		// 加载 SVG 文件
		NSString *svgFilePath6 = [bundle6 pathForResource:@"thumbs-down" ofType:@"svg"];
		if (svgFilePath6) {
			NSError *error = nil;
			NSString *svgContent = [NSString stringWithContentsOfFile:svgFilePath6 encoding:NSUTF8StringEncoding error:&error];
			if (error) {
				NSLog(@"DXPNugges Log:=== Error reading SVG file: %@", error.localizedDescription);
			} else {
				// 替换填充颜色
				NSString *desiredColorHex = isEmptyString_Nd(self.thumbsDownColor)?@"#e24a34":self.thumbsDownColor; // 你想要的颜色
				svgContent = [svgContent stringByReplacingOccurrencesOfString:@"fill=\"#000000\"" withString:[NSString stringWithFormat:@"fill=\"%@\"", desiredColorHex]];
				
				// 将修改后的内容写入临时文件
				NSString *tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp0.svg"];
				[svgContent writeToFile:tempFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
				
				// 重新加载 SVG 内容
				SVGKImage *svgImage = [SVGKImage imageWithContentsOfFile:tempFilePath];
				self.thumbsDownImgview.image = svgImage.UIImage;
			}
		}
		
		
    }
    
    if (self.sendThumnsVal) {
        self.sendThumnsVal((int)tag - 100);
    }
}

#pragma mark -- lazy load
- (UIImageView *)thumbsUpImgview {
    if (!_thumbsUpImgview) {
        _thumbsUpImgview = [[UIImageView alloc] init];
        _thumbsUpImgview.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _thumbsUpImgview;
}

- (UIImageView *)thumbsDownImgview {
    if (!_thumbsDownImgview) {
        _thumbsDownImgview = [[UIImageView alloc] init];
        _thumbsDownImgview.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _thumbsDownImgview;
}

@end
