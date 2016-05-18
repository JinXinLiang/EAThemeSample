//
//  DetailViewController.m
//  EAThemeSample
//
//  Created by Eiwodetianna on 16/5/17.
//  Copyright © 2016年 Eiwodetianna. All rights reserved.
//

#import "DetailViewController.h"
#import <WebKit/WebKit.h>
#import "EATheme.h"

@interface DetailViewController ()
<
WKNavigationDelegate
>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation DetailViewController

- (void)dealloc {
    NSLog(@"detail dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    [self.webView loadHTMLString:[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"EAThemeDemo" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil] baseURL:nil];
    self.webView.navigationDelegate = self;
    self.webView.backgroundColor = [UIColor clearColor];
    
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    @ea_weakify(webView);
    [webView ea_setThemeContents:^(UIView *currentView, NSString *currentThemeIdentifier) {
        
        @ea_strongify(webView);
        NSString *hexBackgroundString = [currentThemeIdentifier isEqualToString:EAThemeBlack] ? @"#777" : @"#ffffff";
        NSString *hexTitleString = [currentThemeIdentifier isEqualToString:EAThemeBlack] ? @"#ffffff" : @"#777";
        NSString *jsString = [NSString stringWithFormat:@"document.body.style.background = \"%@\";document.body.style.webkitTextFillColor= \"%@\";", hexBackgroundString, hexTitleString];
        [webView evaluateJavaScript:jsString completionHandler:nil];
        
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
