//
//  YACOPhoneModelFactory.h
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#import <Foundation/Foundation.h>
#import "YACOPhoneModel.h"





NS_ASSUME_NONNULL_BEGIN

@interface YACOPhoneModelFactory : NSObject
/**
 *  根据手机型号创建对应的工厂（目前是根据屏幕比例）
 *
 *  @return 返回手机型号匹配的工厂
 */
+ (YACOPhoneModel *_Nullable)yaco_createFactory;
@end

NS_ASSUME_NONNULL_END
