//
//  YACOPhoneModel5.m
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#import "YACOPhoneModel5.h"

static const CGFloat percent = 320.0 / 375.0;

@implementation YACOPhoneModel5
- (NSString *)yaco_suffixName {
    return @"6";
}

- (CGFloat)yaco_realFontValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.fontValueDic[valueString] integerValue];
    //    NSAssert(real_value, @"字体号有误，请重新检查");
    //    return real_value * 1.0 / kScreenScale;
    CGFloat font_percent = value >= 38 ? percent : 1;
    if (real_value) {
        return real_value * font_percent / kYAPMScreenScale;
    } else {
        return value * 2.0 * font_percent / (kYAPMScreenScale * 3.0);
    }
}

- (CGFloat)yaco_realModuleValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.moduleValueDic[valueString] integerValue];
    if (real_value) {
        return real_value * percent / kYAPMScreenScale;
    } else {
        return value * 0.6 * percent / kYAPMScreenScale;
    }
}

- (CGFloat)yaco_realImageValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.imageValueDic[valueString] integerValue];
    if (real_value) {
        return real_value * percent / kYAPMScreenScale;
    } else {
        return value * 0.6 * percent / kYAPMScreenScale;
    }
}
@end
