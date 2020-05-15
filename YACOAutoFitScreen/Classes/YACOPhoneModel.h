//
//  YACOPhoneModel.h
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

// 屏幕比例
#define kYAPMScreenScale [UIScreen mainScreen].scale

/*
 1、宽度和高度是否存在比例不一样，需要分别设置
 2、横竖屏切换时，能否自动适配？
 */

NS_ASSUME_NONNULL_BEGIN

@interface YACOPhoneModel : NSObject

@property (nonatomic, strong, nullable) NSDictionary *fontValueDic;   // 字体映射字典
@property (nonatomic, strong, nullable) NSDictionary *moduleValueDic; // 模块大小映射字典
@property (nonatomic, strong, nullable) NSDictionary *imageValueDic;  // 图片大小映射字典


/**
 *  plist文件对应的后缀名
 *
 *  @return plist文件对应的后缀名
 */
- (NSString *_Nullable)yaco_suffixName;

/**
 *  根据6p模块间距的值映射出对应手机尺寸的匹配值
 *
 *  @param value 6p对应的值
 *
 *  @return 根据6p的值映射出对应手机尺寸的匹配值
 */
- (CGFloat)yaco_realFontValueWith6PValue:(NSInteger)value;

/**
 *  根据6p模块字体的值映射出对应手机尺寸的匹配值
 *
 *  @param value 6p对应的值
 *
 *  @return 根据6p模块字体的值映射出对应手机尺寸的匹配值
 */
- (CGFloat)yaco_realModuleValueWith6PValue:(NSInteger)value;

/**
 *  根据6p模块图片大小映射出对应手机尺寸的匹配值
 *
 *  @param value 6p对应的值
 *
 *  @return 根据6p模块图片大小映射出对应手机尺寸的匹配值
 */
- (CGFloat)yaco_realImageValueWith6PValue:(NSInteger)value;


@end

NS_ASSUME_NONNULL_END
