//
//  YACOPhoneModel6p.m
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#import "YACOPhoneModel6p.h"

@implementation YACOPhoneModel6p
- (NSString *)yaco_suffixName {

    //    #ifdef DEBUG
    //        return @"6";
    //    #else
    //        return @"";
    //    #endif
    return @"";
}

- (CGFloat)yaco_realFontValueWith6PValue:(NSInteger)value {
    //    #ifdef DEBUG
    //        NSString *valueString = [NSString stringWithFormat:@"%ld",(long)value];
    //        NSInteger real_value = [self.fontValueDic[valueString] integerValue];
    //        NSAssert(real_value, @"字体号有误，请重新检查");
    //    #else
    //
    //    #endif
    return value / kYAPMScreenScale;
}

- (CGFloat)yaco_realModuleValueWith6PValue:(NSInteger)value {
    return value * 1.0 / kYAPMScreenScale;
}

- (CGFloat)yaco_realImageValueWith6PValue:(NSInteger)value {
    return value / kYAPMScreenScale;
}
@end
