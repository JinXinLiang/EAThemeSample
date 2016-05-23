//
//  UIView+EATheme.h
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  主题切换时的回调方法
 *
 *  @param currentView            
 *    当前设置主题的view
 *  @param currentThemeIdentifier 
 *    当前主题的标示
 */

typedef void(^THEME_CONTENTS)(UIView *currentView, NSString *currentThemeIdentifier);


@interface UIView (EATheme)


/**
 *  设置主题切换时的回调方法
 */
- (void)ea_setThemeContents:(THEME_CONTENTS)themeContents;

@end
