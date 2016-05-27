//
//  EATheme.h
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#ifndef EATheme_h
#define EATheme_h


// 你可以使用下面的宏定义避免在使用block产生的循环引用问题

#define ea_weakify(...) \
ea_keywordify \
ea_metamacro_foreach_cxt(ea_weakify_,, __weak, __VA_ARGS__)

#define ea_strongify(...) \
ea_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
ea_metamacro_foreach(ea_strongify_,, __VA_ARGS__) \
_Pragma("clang diagnostic pop")

#import "UIView+EATheme.h"
#import "EAThemeManager.h"
#import "EA_metamacros.h"
#import "EAThemesConfiguration.h"


#endif /* EATheme_h */
