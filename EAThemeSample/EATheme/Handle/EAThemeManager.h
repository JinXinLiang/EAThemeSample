//
//  EAThemeManager.h
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EAThemeManager : NSObject

// 设置正常状态下的主题标示（ps：必须设置）
@property (nonatomic, copy) NSString *normalThemeIdentifier;

// 获取当前程序采用的主题的标示
@property (nonatomic,readonly,copy) NSString *currentThemeIdentifier;


+ (EAThemeManager *)shareManager;

/**
 *  展示某个主题
 *
 *  @param identifier 需要展示的主题的标示
 */
- (void)displayThemeContentsWithThemeIdentifier:(NSString *)identifier;



@end
