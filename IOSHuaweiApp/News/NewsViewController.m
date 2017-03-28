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
    NSDictionary *_newsDict;
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
    [self setNews];
    [self loadNews:3];
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


-(void)setNews{
    NSArray *titles = [NSArray arrayWithObjects:@"Huawei представила решения корпоративной беспроводной связи нового поколения\n2017-03-23", @"Huawei и SUSE представили операционную систему для сервера KunLun RAS 2.0\n2017-03-22", @"Huawei на CeBIT 2017: путем цифровой трансформации\n2017-03-22", @"Huawei вместе с партнерами создаст экосистему для общеотраслевой цифровой трансформации\n2017-03-15", @"Huawei представила возможности роста для развивающихся рынков\n2017-03-02", @"Совместное заявление по единым стандартам и единой экосистеме на Глобальном саммите по тестированию 5G\n2017-03-01", @"Компания Huawei получила награду Ассоциации GSM за вклад в 5G-эволюцию LTE-сетей\n2017-02-28", @"Huawei представила решение CloudMetro для ускорения облачной трансформации сетей\n2017-02-28", nil];
    NSArray *images = [NSArray arrayWithObjects:@"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/cebit_corporate_wireless.jpg", @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/huawei_suse_2017.jpg", @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/cebit_2017_huawei.jpg", @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/PartnerSummit2017.jpg", @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/mwc2.jpg", @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/5gsummit.jpg",@"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/5gevolution.jpg", @"http://www-file.huawei.com/~/media/CORPORATE/Local-site/ru/Events/cloudmetro.jpg", nil];
    //_newsDict = [[NSDictionary alloc] init];
    _newsDict = [NSDictionary dictionaryWithObjectsAndKeys:titles, @"titles",images, @"images", nil];
                       
}


- (void) loadNews:(NSInteger)j {
    if (_modelArray != nil){
        [_modelArray removeAllObjects];
    }
    _modelArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<j; i++) {
        NSString *title = [[_newsDict valueForKey:@"titles"] objectAtIndex:i];
        NSString *image = [[_newsDict valueForKey:@"images"] objectAtIndex:i];
        NewsModel *model = [[NewsModel alloc] initNews:title image:image];
        [_modelArray addObject:model];
    }
    

}
- (IBAction)categoryChoosen:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            [self loadNews:3];
            break;
        case 1:
            [self loadNews:6];
            break;
        case 2:
            [self loadNews:8];
            break;
        default:
            break;
    }
    
    [self.tableView reloadData];
    NSLog(@"%@",sender);
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
