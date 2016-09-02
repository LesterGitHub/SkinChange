//
//  HomeViewController.m
//  Skin
//
//  Created by Lester on 16/9/2.
//  Copyright © 2016年 Lester-iOS开发:98787555. All rights reserved.
//

#import "HomeViewController.h"
#import "SkinViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"h_skin_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonAction)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

#pragma mark - Button Action
- (void)rightButtonAction{
    SkinViewController *skinVC = [[SkinViewController alloc]init];
    [self.navigationController pushViewController:skinVC animated:YES];
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
