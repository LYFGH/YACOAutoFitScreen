//
//  YACOPhoneModelXSMax.m
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#import "YACOPhoneModelXSMax.h"

@implementation YACOPhoneModelXSMax
- (CGFloat)yaco_realFontValueWith6PValue:(NSInteger)value {
    return value / kYAPMScreenScale;
}

- (CGFloat)yaco_realModuleValueWith6PValue:(NSInteger)value {
    return value * 1.0 / kYAPMScreenScale;
}

- (CGFloat)yaco_realImageValueWith6PValue:(NSInteger)value {
    return value / kYAPMScreenScale;
}
@end
