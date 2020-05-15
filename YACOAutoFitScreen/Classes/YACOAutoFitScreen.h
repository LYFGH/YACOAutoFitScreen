//
//  YACOAutoFitScreen.h
//  YACOAutoFitScreen
//
//  Created by 李亚飞 on 2020/5/15.
//

#ifndef YACOAutoFitScreen_h
#define YACOAutoFitScreen_h

#import "YACOPhoneModelFactory.h"

#define YACOPixelLine ([UIScreen mainScreen].bounds.size.width >= 414 ? (ScaleH(2)) : (ScaleH(1)))

// 模块间距自适配
#define kYACOFitModule(space) roundf([[YACOPhoneModelFactory yaco_createFactory] yaco_realModuleValueWith6PValue:space])
#define kYACOFitModuleDecimal(space) [[YACOPhoneModelFactory yaco_createFactory] yaco_realModuleValueWith6PValue:space]

// 字体大小自适配
#define kYACOFitFont(font) [[YACOPhoneModelFactory yaco_createFactory] yaco_realFontValueWith6PValue:font]
#define kYACOFitFontNormal(font) [UIFont systemFontOfSize:kYACOFitFont(font)]
#define kYACOFitFontBold(font) [UIFont boldSystemFontOfSize:kYACOFitFont(font)]

// 图片大小自适配
#define kYACOFitImage(image) [[YACOPhoneModelFactory yaco_createFactory] yaco_realImageValueWith6PValue:image]



#endif /* YACOAutoFitScreen_h */
