//
//  HomeViewController.m
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import "HomeViewController.h"
#import "EATheme.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation HomeViewController

- (void)dealloc {
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEAChangeThemeNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.button ea_setThemeContents:^(UIView *currentView, NSString *currentThemeIdentifier) {
        UIButton *button = (UIButton *)currentView;
        UIColor *titleColor = [currentThemeIdentifier isEqualToString:EAThemeNormal] ? [UIColor blackColor] : [UIColor whiteColor];
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidDisplay) name:kEAChangeThemeNotification object:nil];
    

}

- (void)themeDidDisplay {
    NSLog(@"current theme is %@!", [EAThemeManager shareManager].currentThemeIdentifier);
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
