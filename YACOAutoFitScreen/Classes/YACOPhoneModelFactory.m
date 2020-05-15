//
//  YACOPhoneModelFactory.m
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#import "YACOPhoneModelFactory.h"
#import "YACOPhoneModel5.h"
#import "YACOPhoneModel6.h"
#import "YACOPhoneModel6p.h"
#import "YACOPhoneModelX.h"
#import "YACOPhoneModelXSMax.h"
#import <sys/utsname.h>

// 设备类型
typedef NS_ENUM(NSUInteger, YACODeviceMode) {
    // iPhone 5 一类的机型，逻辑尺寸为 320x568
    // 设备包括：iPhone 5 / iPhone 5s / iPhone SE
    YACOiPhone5ClassMode,
    // iPhone 8 一类的非 Plus 机型，逻辑尺寸为 375x667
    // 设备包括：iPhone 6(s) / iPhone 7 / iPhone 8
    YACOiPhone8ClassMode,
    // iPhone 8 Plus 一类的 Plus 机型，逻辑尺寸为 414x736
    // 设备包括：iPhone 6(s) Plus / iPhone 7 Plus / iPhone 8 Plus
    YACOiPhone8PlusClassMode,
    // iPhone X 一类的机型，可以看做是拉长版的非 Plus 机型，逻辑尺寸为 375x812
    // 设备包括：iPhone X / iPhone XS
    YACOiPhoneXClassMode,
    // iPhone XS Max 一类的机型，可以看做是拉长版的 Plus 机型，逻辑尺寸为 414x896
    // 设备包括：iPhone XR / iPhone XS Max
    YACOiPhoneXSMaxMode,
};

typedef NS_ENUM(NSInteger,DeviceType) {
    Unknown = 0,
    Simulator,
    IPhone_1G,          //基本不用
    IPhone_3G,          //基本不用
    IPhone_3GS,         //基本不用
    IPhone_4,           //基本不用
    IPhone_4s,          //基本不用
    IPhone_5,
    IPhone_5C,
    IPhone_5S,
    IPhone_SE,
    IPhone_6,
    IPhone_6P,
    IPhone_6s,
    IPhone_6s_P,
    IPhone_7,
    IPhone_7P,
    IPhone_8,
    IPhone_8P,
    IPhone_X,
    iPhone_XR,
    iPhone_XS,
    iPhone_XS_Max,
};



@implementation YACOPhoneModelFactory
+ (YACOPhoneModel *)yaco_createFactory {
    static YACOPhoneModel *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        YACODeviceMode deviceMode = YACOiPhone5ClassMode;
//        DeviceType currentDeviceType = [self deviceType];
//        if (currentDeviceType == Unknown || currentDeviceType == Simulator) {
            deviceMode = [self deviceModeWithSize:[UIScreen mainScreen].bounds.size];
//        }else{
//             deviceMode = [self deviceModeWithType:currentDeviceType];
//        }
        
        switch (deviceMode) {
            case YACOiPhone5ClassMode:
                factory = [[YACOPhoneModel5 alloc] init];
                break;
            case YACOiPhone8ClassMode:
                factory = [[YACOPhoneModel6 alloc] init];
                break;
            case YACOiPhone8PlusClassMode:
                factory = [[YACOPhoneModel6p alloc] init];
                break;
            case YACOiPhoneXClassMode:
                factory = [[YACOPhoneModelX alloc] init];
                break;
            case YACOiPhoneXSMaxMode:
                factory = [[YACOPhoneModelXSMax alloc] init];
                break;
            default:
                break;
        }
        
        NSString *suffixName = factory.yaco_suffixName;
        factory.fontValueDic = [self p_getValueDictionaryWithTypeName:@"FontValue" suffixName:suffixName];
        factory.moduleValueDic = [self p_getValueDictionaryWithTypeName:@"ModuleValue" suffixName:suffixName];
        factory.imageValueDic = [self p_getValueDictionaryWithTypeName:@"ImageValue" suffixName:suffixName];
    });
    return factory;
}

+ (NSDictionary *)p_getValueDictionaryWithTypeName:(NSString *)typeName suffixName:(NSString *)suffixName {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *plistNameNew = [NSString stringWithFormat:@"%@.bundle/%@%@", @"VPAutoFitScreen", typeName, suffixName];
    NSString *path = [bundle pathForResource:plistNameNew ofType:@"plist"];
    NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:path];
    return dataDic;
}

// 根据machne取到设备类型.
+(DeviceType )deviceType
{
   // https://www.theiphonewiki.com/wiki/Models
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
    //simulator
    if ([platform isEqualToString:@"i386"])          return Simulator;
    if ([platform isEqualToString:@"x86_64"])        return Simulator;
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])     return IPhone_1G;
    if ([platform isEqualToString:@"iPhone1,2"])     return IPhone_3G;
    if ([platform isEqualToString:@"iPhone2,1"])     return IPhone_3GS;
    if ([platform isEqualToString:@"iPhone3,1"])     return IPhone_4;
    if ([platform isEqualToString:@"iPhone3,2"])     return IPhone_4;
    if ([platform isEqualToString:@"iPhone3,3"])     return IPhone_4;
    if ([platform isEqualToString:@"iPhone4,1"])     return IPhone_4s;
    if ([platform isEqualToString:@"iPhone5,1"])     return IPhone_5;
    if ([platform isEqualToString:@"iPhone5,2"])     return IPhone_5;
    if ([platform isEqualToString:@"iPhone5,3"])     return IPhone_5C;
    if ([platform isEqualToString:@"iPhone5,4"])     return IPhone_5C;
    if ([platform isEqualToString:@"iPhone6,1"])     return IPhone_5S;
    if ([platform isEqualToString:@"iPhone6,2"])     return IPhone_5S;
    if ([platform isEqualToString:@"iPhone7,1"])     return IPhone_6P;
    if ([platform isEqualToString:@"iPhone7,2"])     return IPhone_6;
    if ([platform isEqualToString:@"iPhone8,1"])     return IPhone_6s;
    if ([platform isEqualToString:@"iPhone8,2"])     return IPhone_6s_P;
    if ([platform isEqualToString:@"iPhone8,4"])     return IPhone_SE;
    if ([platform isEqualToString:@"iPhone9,1"])     return IPhone_7;
    if ([platform isEqualToString:@"iPhone9,3"])     return IPhone_7;
    if ([platform isEqualToString:@"iPhone9,2"])     return IPhone_7P;
    if ([platform isEqualToString:@"iPhone9,4"])     return IPhone_7P;
    if ([platform isEqualToString:@"iPhone10,1"])    return IPhone_8;
    if ([platform isEqualToString:@"iPhone10,4"])    return IPhone_8;
    if ([platform isEqualToString:@"iPhone10,2"])    return IPhone_8P;
    if ([platform isEqualToString:@"iPhone10,5"])    return IPhone_8P;
    if ([platform isEqualToString:@"iPhone10,3"])    return IPhone_X;
    if ([platform isEqualToString:@"iPhone10,6"])    return IPhone_X;
    if ([platform isEqualToString:@"iPhone11,8"])    return iPhone_XR;
    if ([platform isEqualToString:@"iPhone11,2"])    return iPhone_XS;
    if ([platform isEqualToString:@"iPhone11,4"] || [platform isEqualToString:@"iPhone11,6"])  return iPhone_XS_Max;
    
    return Unknown;
}


+ (YACODeviceMode)deviceModeWithSize:(CGSize)deviceSize {
    if (CGSizeEqualToSize(deviceSize, (CGSize){320, 568})) {
        return YACOiPhone5ClassMode;
    } else if (CGSizeEqualToSize(deviceSize, (CGSize){375, 667})) {
        return YACOiPhone8ClassMode;
    } else if (CGSizeEqualToSize(deviceSize, (CGSize){375, 812})) {
        return YACOiPhoneXClassMode;
    } else if (CGSizeEqualToSize(deviceSize, (CGSize){414, 736})) {
        return YACOiPhone8PlusClassMode;
    } else if (CGSizeEqualToSize(deviceSize, (CGSize){414, 896})) {
        // 兼容 iPhone XR 的 @2x 屏
        if ([UIScreen mainScreen].scale == 2.0) {
            return YACOiPhone8ClassMode;
        } else {
            return YACOiPhoneXSMaxMode;
        }
    } else {
        return YACOiPhoneXClassMode;
    }
}

+ (YACODeviceMode)deviceModeWithType:(DeviceType)deviceType
{
    if(deviceType == IPhone_1G ||
       deviceType == IPhone_3G ||
       deviceType == IPhone_3GS ||
       deviceType == IPhone_4 ||
       deviceType == IPhone_4s ||
       deviceType == IPhone_5 ||
       deviceType == IPhone_5C ||
       deviceType == IPhone_5S ||
       deviceType == IPhone_SE){
        return YACOiPhone5ClassMode;
    }else if (deviceType == IPhone_6 ||
              deviceType == IPhone_7 ||
              deviceType == IPhone_8 ||
              deviceType == IPhone_6s ||
              deviceType == iPhone_XR){
         return YACOiPhone8ClassMode;
    }else if (deviceType == IPhone_X ||
              deviceType == iPhone_XS){
         return YACOiPhoneXClassMode;
    }else if (deviceType == IPhone_6P ||
              deviceType == IPhone_6s_P ||
              deviceType == IPhone_7P ||
              deviceType == IPhone_8P){
        return  YACOiPhone8PlusClassMode;
    }else if (deviceType == iPhone_XS_Max){
        return YACOiPhoneXSMaxMode;
    }
    return YACOiPhoneXClassMode;
}
@end
