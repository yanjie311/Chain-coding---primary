//
//  WYJLinkerButton.m
//  WYJStudyItem
//
//  Created by wangyanjie on 17/5/2.
//  Copyright © 2017年 wangyanjie. All rights reserved.
//

#import "WYJLinkerButton.h"
#import <objc/runtime.h>

static const char clickActionKey;
@implementation WYJLinkerButton

- (WYJLinkerButton *(^)(float, float, float, float))ImageEdgInsets {
    return ^WYJLinkerButton * (float left,float top,float width,float height) {
        self.jmImagev.frame = CGRectMake(left, top, width, height);
        return self;
    };
}

- (WYJLinkerButton *(^)(float, float, float, float))TitleEdgInsets {
    return ^WYJLinkerButton* (float left,float top,float width,float height) {
        self.jmLabel.frame = CGRectMake(left, top, width, height);
        return self;
    };
}

- (WYJLinkerButton *(^)(NSString *, NSInteger, UIColor *, NSTextAlignment))TitlePrams {
    return ^WYJLinkerButton* (NSString* title,NSInteger fountSize,UIColor*textColor, NSTextAlignment textAlignment){
        self.jmLabel.text = title;
        self.jmLabel.textColor = textColor;
        self.jmLabel.font = [UIFont systemFontOfSize:fountSize];
        self.jmLabel.textAlignment = textAlignment;
        return self;
    };
}
//block的getter
-(WYJLinkerButton *(^)(NSString *, UIViewContentMode))ImagePrams{

    return ^WYJLinkerButton* (NSString* imgName,UIViewContentMode mode){

        self.jmImagev.image = [UIImage imageNamed:imgName];
        self.jmImagev.contentMode = mode;

        return self;
    };
}

//block的嵌套getter
-(WYJLinkerButton *(^)(WYJLinkerButton*))ClickAction{

    return ^WYJLinkerButton* (WYJLinkerButton* sender){
        if (!objc_getAssociatedObject(self, &clickActionKey)) {
            UIGestureRecognizer* gesture = objc_getAssociatedObject(self, &clickActionKey);
            if (!gesture) {
                gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction:)];
                objc_setAssociatedObject(self, &clickActionKey, gesture, OBJC_ASSOCIATION_RETAIN);
                [self addGestureRecognizer:gesture];
            }
//            objc_setAssociatedObject(self, &blockActionKey, block, OBJC_ASSOCIATION_COPY);
        }        
        return self;
    };
}

- (void)clickAction:(id)sender {
    NSLog(@"点击了！！！");
    
}

+ (instancetype)creatButton:(CGRect)frame {
    WYJLinkerButton *button = [[WYJLinkerButton alloc] initWithFrame:frame];
    return button;
}

- (UIImageView *)jmImagev {
    if (!_jmImagev) {
        _jmImagev = [[UIImageView alloc] init];
        [self addSubview:self.jmImagev];
    }
    return _jmImagev;
}

- (UILabel *)jmLabel {
    if (!_jmLabel) {
        _jmLabel = [[UILabel alloc] init];
        [self addSubview:_jmLabel];
    }
    return _jmLabel;
}

@end
