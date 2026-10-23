//
//  CYLTabBarController.h
//  CYLTabBarController
//
//  v1.99.x Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 10/20/15.
//  Copyright © 2026 https://github.com/ChenYilong . All rights reserved.
//

#import "CYLTabBarBadgeView.h"

@interface CYLTabBarBadgeView ()

@property (nonatomic, strong) UILabel *badgeLabel;

@end

@implementation CYLTabBarBadgeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.masksToBounds = YES;
        [self badgeLabel];
    }
    return self;
}

- (UILabel *)badgeLabel {
    if (!_badgeLabel) {
        _badgeLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
        _badgeLabel.backgroundColor = [UIColor clearColor];
        _badgeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

//        _badgeLabel.font = kCYLBadgeDefaultFont;//[UIFont systemFontOfSize:11];
        _badgeLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:_badgeLabel];
        [self bringSubviewToFront:_badgeLabel];
    }
    return _badgeLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.badgeLabel.frame = self.bounds;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _badgeLabel.frame = self.bounds;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
    if (textAlignment) {
        [self.badgeLabel setTextAlignment:textAlignment];
    }
}

- (void)setTextColor:(UIColor *)badgeTextColor {
    _textColor = badgeTextColor;
    if (badgeTextColor) {
        self.badgeLabel.textColor = badgeTextColor;
    }
}

- (void)setFont:(UIFont *)badgeTextFont {
    _font = badgeTextFont;
    if (badgeTextFont) {
        self.badgeLabel.font = badgeTextFont;
    }
}

- (void)setText:(NSString *)badgeValue {
    if (![_text isEqualToString:badgeValue]) {
        _text = [badgeValue copy];
        self.badgeLabel.text = [badgeValue copy];
    }
}

- (void)setBadgeContentInset:(UIEdgeInsets)badgeContentInset {
    if (!UIEdgeInsetsEqualToEdgeInsets(_badgeContentInset, badgeContentInset)) {
        _badgeContentInset = badgeContentInset;
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    if (_text.length == 0) {
        return CGSizeZero;
    }
    CGSize badgeSize = [_text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:0 attributes:@{NSFontAttributeName:self.badgeLabel.font} context:nil].size;
    CGFloat width = badgeSize.width + _badgeContentInset.left + _badgeContentInset.right;
    CGFloat height = badgeSize.height + _badgeContentInset.top + _badgeContentInset.bottom;
    height = MAX(height, 18.0);
    width = MAX(width, height);
    return CGSizeMake(width, height);
}

@end
