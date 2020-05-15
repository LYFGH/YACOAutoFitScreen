//
//  YACOPhoneModel6.m
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#import "YACOPhoneModel6.h"

@implementation YACOPhoneModel6
- (NSString *)yaco_suffixName {
    return @"6";
}

- (CGFloat)yaco_realFontValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.fontValueDic[valueString] integerValue];
    //    NSAssert(real_value, @"字体号有误，请重新检查");
    //    return real_value / kScreenScale;
    if (real_value) {
        return real_value / kYAPMScreenScale;
    } else {
        return value * 2.0 / (kYAPMScreenScale * 3.0);
    }
}

- (CGFloat)yaco_realModuleValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.moduleValueDic[valueString] integerValue];
    if (real_value) {
        return real_value * 1.0 / kYAPMScreenScale;
    } else {
        return value * 0.6 / kYAPMScreenScale;
    }
}

- (CGFloat)yaco_realImageValueWith6PValue:(NSInteger)value {
    NSString *valueString = [NSString stringWithFormat:@"%ld", (long)value];
    NSInteger real_value = [self.imageValueDic[valueString] integerValue];
    if (real_value) {
        return real_value / kYAPMScreenScale;
    } else {
        return value * 0.6 / kYAPMScreenScale;
    }
}

@end
