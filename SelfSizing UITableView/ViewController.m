//
//  ViewController.m
//  SelfSizing UITableView
//
//  Created by Niklas Rammerstorfer on 24.07.18.
//  Copyright © 2018 Niklas Rammerstorfer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// IBOutlets
@property (weak, nonatomic) IBOutlet UITableView        *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightConstraint;

// Other Properties
@property (nonatomic, strong) NSMutableArray<NSString*> *data;
@property (nonatomic, assign) NSInteger                 dataCount;
@end

@implementation ViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data                   = [NSMutableArray<NSString*> new];
    self.tableView.dataSource   = self;
}

#pragma mark - UI Interaction Control(s)

- (IBAction)addButtonTouchUpInside:(id)sender {
    [self.data addObject:[NSString stringWithFormat:@"test%d", (int)self.dataCount++]];
    
    [self.tableView reloadData];
    self.tableViewHeightConstraint.constant = self.tableView.contentSize.height;
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell new] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:@""];
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}

@end
