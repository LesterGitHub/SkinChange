//
//  SkinViewController.m
//  Skin
//
//  Created by Lester on 16/9/2.
//  Copyright © 2016年 Lester-iOS开发:98787555. All rights reserved.
//

#import "SkinViewController.h"
#import "SkinCollectionViewCell.h"

/** 标识*/
static NSString *const identifier = @"collectionIdentifier";

@interface SkinViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIAlertViewDelegate>{
    /** 宽高*/
    CGFloat collectionWidth;
    CGFloat collectionHeight;
    /** data*/
    NSMutableArray *data;
}
/** UICollectionView*/
@property (strong, nonatomic) UICollectionView *collectionView;
/** UICollectionViewLayout*/
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@end

@implementation SkinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择皮肤";
    
    collectionWidth = (self.view.bounds.size.width - 20) / 3;
    collectionHeight = 180;
    [self.view addSubview:self.collectionView];
    

    [self.collectionView registerClass:[SkinCollectionViewCell class] forCellWithReuseIdentifier:identifier];
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)layout{
    if(!_layout){
        _layout = [[UICollectionViewFlowLayout alloc]init];
    }
    return _layout;
}
- (NSArray *)data{
    if(!data){
        data = [[NSMutableArray alloc]init];
        for(NSInteger i =0; i < 12; i++){
            NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"iamge_%li.PNG",i] ofType:nil];
            [data addObject:path];
        }
    }
    return data;
}

#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SkinCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.data[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    /** 因时间仓促,没有对选择主题进行代码封装,就草草了事了.*/
    UIColor *tempColor = nil;
    if(indexPath.row==0){
        tempColor = [UIColor blackColor];
    }
    else if (indexPath.row==1){
        tempColor = [UIColor redColor];
    }
    else if (indexPath.row==2){
        tempColor = [UIColor colorWithRed:204/255.0 green:0/255.0 blue:51/255.0 alpha:1];
    }
    else if (indexPath.row==3){
        tempColor = [UIColor grayColor];
    }
    else if (indexPath.row==4){
        tempColor = [UIColor cyanColor];
    }
    else if (indexPath.row==5){
        tempColor = [UIColor magentaColor];
    }
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"skin" object:nil userInfo:@{@"Color":tempColor}];
    
    [[[UIAlertView alloc]initWithTitle:@"主题已更换,是否返回主界面查看?" message:@"Lester邀请您加入iOS高级研发群:98787555" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:@"继续查看", nil]show];
}

#pragma mark - UICollectionView DelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){collectionWidth,collectionHeight};
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.5;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){self.view.bounds.size.width,0};
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return (CGSize){self.view.bounds.size.width,0};
}

#pragma mark - UIAlertView Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        [self.navigationController popViewControllerAnimated:YES];
    }
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
