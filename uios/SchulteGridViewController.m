//
//  SchulteGridViewController.m
//  uios
//
//  Created by rory.zhang on 16/12/27.
//  Copyright © 2016年 rory.zhang. All rights reserved.
//

#import "SchulteGridViewController.h"

@interface SchulteGridViewController ()

@property NSMutableArray *resultArray;
@property NSTimer *timer;
@property NSDate *date;

@end

@implementation SchulteGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initButtonTitle];
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

- (void) initButtonTitle {
    self.resultArray = [NSMutableArray array];
    NSArray * array = [self getDataArray];
    //TODO
}

- (NSArray *) getDataArray {
    NSMutableArray *arr = [NSMutableArray array];
    for(NSInteger i=0; i<10; i++) {
        [arr addObject:@(i)];
    }
    NSInteger count = [arr count];
    for(NSInteger i=0; i<count; i++) {
        NSInteger index = arc4random()%(count-i)+i;
        [arr exchangeObjectAtIndex:index withObjectAtIndex:i];
    }
    return arr;
}

@end
