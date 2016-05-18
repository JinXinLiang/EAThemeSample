//
//  EAThemeManager.m
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import "EAThemeManager.h"
#import "UIView+EATheme.h"

NSString *const EATheme = @"EATheme";

@interface EAThemeManager ()

@property(nonatomic,readwrite,copy)NSString *currentThemeIdentifier;

@end

@implementation EAThemeManager

+ (EAThemeManager *)shareManager {
    static EAThemeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[EAThemeManager alloc] init];
        manager.currentThemeIdentifier = nil;
    });
    return manager;
}

- (void)setNormalThemeIdentifier:(NSString *)normalThemeIdentifier {
    if (![_normalThemeIdentifier isEqualToString:normalThemeIdentifier]) {

            if (!self.currentThemeIdentifier) {
                
                [self displayThemeContentsWithThemeIdentifier:normalThemeIdentifier];
            }
        _normalThemeIdentifier = normalThemeIdentifier;
    }
}

- (void)displayThemeContentsWithThemeIdentifier:(NSString *)identifier {
    if (identifier && ![identifier isEqualToString:self.currentThemeIdentifier]) {
        
        [self p_saveSettingWithThemeIdentifier:identifier];
        [[NSNotificationCenter defaultCenter] postNotificationName:EAChangeThemeNotification object:nil];
    }
}

- (void)p_saveSettingWithThemeIdentifier:(NSString *)identifier {
    [[NSUserDefaults standardUserDefaults] setObject:identifier forKey:EATheme];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)currentThemeIdentifier {
    return [[NSUserDefaults standardUserDefaults] objectForKey:EATheme];
}

@end
