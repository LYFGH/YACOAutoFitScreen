//
//  YACOPhoneModelX.m
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#import "YACOPhoneModelX.h"

#define kYAPMScreenScaleX 2//完全按照iphone6的屏幕宽度尺寸，kScreenScale调整实际计算为3，调整和iphone6一致强制改为2


@implementation YACOPhoneModelX
- (NSString *)yaco_suffixName {
    return @"X";
}

- (CGFloat)yaco_realFontValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.fontValueDic[valueString] integerValue];
    if (real_value) {
        return real_value / kYAPMScreenScaleX;
    } else {
        return value * 2.0 / (kYAPMScreenScaleX * 3.0);
    }
}

- (CGFloat)yaco_realModuleValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.moduleValueDic[valueString] integerValue];
    if (real_value) {
        return real_value * 1.0 / kYAPMScreenScaleX;
    } else {
        return value * 0.6 / kYAPMScreenScaleX;
    }
}

- (CGFloat)yaco_realImageValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.imageValueDic[valueString] integerValue];
    if (real_value) {
        return real_value / kYAPMScreenScaleX;
    } else {
        return value * 0.6 / kYAPMScreenScaleX;
    }
}
@end
