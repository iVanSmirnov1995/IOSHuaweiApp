//
//  NewsViewController.m
//  IOSHuaweiApp
//
//  Created by devil1001 on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"

@interface NewsViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_modelArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryChoose;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Новости";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self loadNews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableViewMessege numberOfRowsInSection:(NSInteger)section {
    return _modelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableViewMessege heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 280.f;
}


- (void) loadNews {
    if (_modelArray != nil){
        [_modelArray removeAllObjects];
    }
    _modelArray = [[NSMutableArray alloc] init];
    NSString *title = @"Huawei представила решения корпоративной беспроводной связи нового поколения";
        NSString *image = @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/cebit_corporate_wireless.jpg";
    NewsModel *model = [[NewsModel alloc] initNews:title image:image];
    [_modelArray addObject:model];
    
    title = @"Huawei и SUSE представили операционную систему для сервера KunLun RAS 2.0";
    image = @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/huawei_suse_2017.jpg";
    NewsModel *model2 = [[NewsModel alloc] initNews:title image:image];
    [_modelArray addObject:model2];
    title = @"Huawei на CeBIT 2017: путем цифровой трансформации";
    image = @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/cebit_2017_huawei.jpg";
    NewsModel *model3 = [[NewsModel alloc] initNews:title image:image];
    [_modelArray addObject:model3];

}

- (UITableViewCell *)tableView:(UITableView *)tableViewMessege cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableViewMessege dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    NewsModel *model;
    if ([_modelArray[indexPath.row] isMemberOfClass:[NewsModel class]]) {
        model = _modelArray[indexPath.row];
        [cell fillCellWithModel:model];
    }
    return cell;
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
