//
//  ViewController.m
//  ClearNavDemo
//
//  Created by lvshasha on 2017/8/14.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "ViewController.h"
#import "TitleViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //
    self.navigationItem.title = @"我的";
    //
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"item2" style:UIBarButtonItemStyleDone target:self action:@selector(colorChange:)];
    
    //
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"item1" style:UIBarButtonItemStyleDone target:self action:@selector(colorChange:)];
    
    //
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIImageView *mineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imgaeMine.jpg"]];
    mineImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 420 / 750);
    self.tableView.tableHeaderView = mineImageView;
    
    
    //
    self.navAlpha = 0;
    self.navBarTitleColor = [UIColor whiteColor];
    self.navBarColor = [UIColor greenColor];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    self.navAlpha = y / 80;
    if (y > 80) {
        self.navBarTitleColor = [UIColor blueColor];
    } else {
        self.navBarTitleColor = y < 0 ? [UIColor yellowColor] : [UIColor whiteColor];
    }
}

- (void)colorChange:(UIBarButtonItem *)change
{
    TitleViewController *ctrl = [[TitleViewController alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"☺☺%ld",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
