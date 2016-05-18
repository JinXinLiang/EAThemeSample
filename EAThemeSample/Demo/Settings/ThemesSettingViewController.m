//
//  SettingViewController.m
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import "ThemesSettingViewController.h"
#import "EATheme.h"

@interface ThemesSettingViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *themeTitleArray;

@end

@implementation ThemesSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.themeTitleArray = @[EAThemeNormal, EAThemeBlack, EAThemeRed, EAThemeOrange, EAThemeBlue];
    
    @ea_weakify(self);
    [self.tableView ea_setThemeContents:^(UIView *currentView, NSString *currentThemeIdentifier) {
        @ea_strongify(self);
        currentView.backgroundColor = self.view.backgroundColor;
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _themeTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *themeTitleCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    themeTitleCell.textLabel.text = _themeTitleArray[indexPath.row];
    
    
    @ea_weakify(tableView);
    [themeTitleCell ea_setThemeContents:^(UIView *currentView, NSString *currentThemeIdentifier) {
        @ea_strongify(tableView);
        UITableViewCell *cell = (UITableViewCell *)currentView;
        cell.backgroundColor = tableView.backgroundColor;
        cell.contentView.backgroundColor = tableView.backgroundColor;
        cell.textLabel.textColor = [currentThemeIdentifier isEqualToString:EAThemeNormal] ? [UIColor blackColor] : [UIColor whiteColor];
    }];
    
    return themeTitleCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[EAThemeManager shareManager] displayThemeContentsWithThemeIdentifier:_themeTitleArray[indexPath.row]];
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
