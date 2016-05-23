# EATheme/主题切换/夜间模式
**在项目中引入主头文件**

	#import "EATheme.h"
**在EAThemesConfiguration.h中自定义主题的常量字符串作为应用程序每种主题的identifier，范例：**

	// 这里设置了5种主题的标示
    static NSString *const EAThemeNormal = @"EAThemeNormal";
	static NSString *const EAThemeBlack = @"EAThemeBlack";
	static NSString *const EAThemeRed = @"EAThemeRed";
	static NSString *const EAThemeOrange = @"EAThemeOrange";
	static NSString *const EAThemeBlue = @"EAThemeBlue";
    
**- (BOOL)application: didFinishLaunchingWithOptions:方法中配置应用程序默认主题，即正常状态下的主题：**

	// 必须配置正常状态下的主题标示
    [EAThemeManager shareManager].normalThemeIdentifier = EAThemeNormal;
    
**在需要设置夜间模式的控件调用UIView类目中的设置方法，在Block回调中根据主题的identifier设置该视图的对应状态。**

	UITabBarController *rootViewController = (UITabBarController *)self.window.rootViewController;
    
    NSDictionary *tabBarColorDic = @{EAThemeNormal : [UIColor whiteColor], EAThemeBlack : [UIColor blackColor], EAThemeRed : [UIColor redColor], EAThemeOrange : [UIColor orangeColor], EAThemeBlue : [UIColor blueColor]};
    
    [rootViewController.tabBar ea_setThemeContents:^(UIView *currentView, NSString *currentThemeIdentifier) {
        UITabBar *bar = (UITabBar *)currentView;
        bar.barTintColor = tabBarColorDic[currentThemeIdentifier];
    }];

    
**可通过EAThemeManager单例的currentThemeIdentifier属性随时获取当前的主题标示：**

	[[EAThemeManager shareManager] currentThemeIdentifier];

**通过主题标示启动某个主题：**

	// 开启黑色主题
	[[EAThemeManager shareManager] displayThemeContentsWithThemeIdentifier:EAThemeBlack]; 
	
**可使用通知中心自定义监听改变主题事件**

	extern NSString *const EAChangeThemeNotification; // 主题改变的监听事件名称
	
**注：Block内存问题:**   
在封装时已尽量让使用者避免内存的问题，如果只是对当前的view设置背景颜色，可以直接使用Block回调中的参数currentView,不会产生内存问题，更复杂的情况，EATheme已借引ReactiveCocoa中的内存管理的宏，方便大家使用（个人觉得这个宏真心好用）例如：
	
	@ea_weakify(self);
    [self.tableView ea_setThemeContents:^(UIView *currentView, NSString *currentThemeIdentifier) {
        @ea_strongify(self);
        currentView.backgroundColor = self.view.backgroundColor;
    }];
**最后，如果在使用中遇到了问题，欢迎大家在Issues里提问。**