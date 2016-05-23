//
//  UIView+EATheme.m
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import "UIView+EATheme.h"
#import "EAThemeManager.h"
#import <objc/runtime.h>

static void *EAViewThemesKey = "EAViewThemesKey";

@interface UIView ()

@property (nonatomic, copy) THEME_CONTENTS themeContents;

@end

@implementation UIView (EATheme)

- (void)ea_dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEAChangeThemeNotification object:nil];
    
    [self ea_dealloc];
    
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method deallocMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
        Method ea_deallocMethod = class_getInstanceMethod([self class], @selector(ea_dealloc));
        method_exchangeImplementations(deallocMethod, ea_deallocMethod);
        
        
    });
    
}

- (void)setThemeContents:(THEME_CONTENTS)themeContents {
     objc_setAssociatedObject(self, EAViewThemesKey, themeContents, OBJC_ASSOCIATION_COPY);
}

- (THEME_CONTENTS)themeContents {

    return objc_getAssociatedObject(self, EAViewThemesKey);
}



- (void)ea_setThemeContents:(THEME_CONTENTS)themeContents {
    
    
    if (themeContents) {
        
        self.themeContents = themeContents;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_changeTheme) name:kEAChangeThemeNotification object:nil];
        [self p_changeTheme];
        
    }
    

}

- (void)p_changeTheme {
    NSString *contentThemeIdentifier = [[EAThemeManager shareManager] currentThemeIdentifier];
    
    if (contentThemeIdentifier) {
        
        if (self.themeContents) {
            self.themeContents(self, contentThemeIdentifier);
        } 
    }
    
}

@end
