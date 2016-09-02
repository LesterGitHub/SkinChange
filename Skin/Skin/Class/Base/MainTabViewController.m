//
//  MainTabViewController.m
//  Skin
//
//  Created by Lester on 16/9/2.
//  Copyright © 2016年 Lester-iOS开发:98787555. All rights reserved.
//

#import "MainTabViewController.h"
#import "NavigationViewController.h"
#import "HomeViewController.h"
#import "LinkViewController.h"
#import "DynamicViewController.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildControllers];
    [self viewWillLayoutSubviews];
}

- (void)setupChildControllers
{
    self.tabBar.tintColor = [UIColor orangeColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12.0f], NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [self setupChildNavigationControllerWithClass:[NavigationViewController class] tabBarImageName:@"tab_home_icon" rootViewControllerClass:[HomeViewController class] rootViewControllerTitle:@"消息"];
    [self setupChildNavigationControllerWithClass:[NavigationViewController class] tabBarImageName:@"tab_link_icon" rootViewControllerClass:[LinkViewController class] rootViewControllerTitle:@"联系人"];
    [self setupChildNavigationControllerWithClass:[NavigationViewController class] tabBarImageName:@"tab_dynamic_icon" rootViewControllerClass:[DynamicViewController class] rootViewControllerTitle:@"动态"];
    
}
- (void)viewWillLayoutSubviews{
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 50;
    tabFrame.origin.y = self.view.frame.size.height - 50;
    self.tabBar.frame = tabFrame;
}
- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title
{
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    rootVC.title = title;
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.image = [UIImage imageNamed:name];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel", name]];
    [self addChildViewController:navVc];
    
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
