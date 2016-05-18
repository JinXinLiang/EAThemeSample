//
//  BaseNavigationController.m
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import "BaseNavigationController.h"
#import "EATheme.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *barColorDic = @{EAThemeNormal : [UIColor whiteColor], EAThemeBlack : [UIColor blackColor], EAThemeRed : [UIColor redColor], EAThemeOrange : [UIColor orangeColor], EAThemeBlue : [UIColor blueColor]};
    
    [self.navigationBar ea_setThemeContents:^(UIView *currentView, NSString *currentThemeIdentifier) {
        UINavigationBar *bar = (UINavigationBar *)currentView;
        bar.barStyle = [currentThemeIdentifier isEqualToString:EAThemeNormal] ? UIBarStyleDefault : UIBarStyleBlack;
        bar.barTintColor = barColorDic[currentThemeIdentifier];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
