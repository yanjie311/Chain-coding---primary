//
//  WYJLinkerButton.h
//  WYJStudyItem
//
//  Created by wangyanjie on 17/5/2.
//  Copyright © 2017年 wangyanjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYJLinkerButton : UIView
@property (nonatomic, strong) UIImageView *jmImagev;
@property (nonatomic, strong) UILabel *jmLabel;
/** Imagev的frame，参数为“(x, y, w, h)”  */
@property(nonatomic,copy)
WYJLinkerButton* (^ImageEdgInsets)(float left,float top,float width,float height);
/** Title的frame，参数为“(x, y, w, h)” */
@property(nonatomic,copy)
WYJLinkerButton* (^TitleEdgInsets)(float left,float top,float width,float height);
/** Imagev的参数值，“(NSString* imgName,UIViewContentMode mode)” */
@property(nonatomic,copy)
WYJLinkerButton* (^ImagePrams)(NSString* imgName,UIViewContentMode mode);
/** Title的参数值，“(title, fountSize, textColor)” */
@property(nonatomic,copy)
WYJLinkerButton* (^TitlePrams)(NSString* title,NSInteger fountSize,UIColor*textColor, NSTextAlignment textAlignment);
/** 点击事件，“(id target, SEL clickAction)” */
@property(nonatomic,copy)WYJLinkerButton* (^ClickAction)(WYJLinkerButton* sender);

//创建按钮
+ (instancetype)creatButton:(CGRect)frame;
@end
