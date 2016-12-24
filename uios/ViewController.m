//
//  ViewController.m
//  uios
//
//  Created by rory.zhang on 16/12/24.
//  Copyright © 2016年 rory.zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)changeColor:(id)sender {
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    
    UIColor *color = [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];
    [self.view setBackgroundColor:color];
    
    NSDate *date = [_datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeText = [dateFormatter stringFromDate:date];
    /**
    UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"Tip" message:timeText delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alterView show];
    **/
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Tip" message:timeText preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"clicked.");
    }]];
    [self presentViewController:alertController animated:true completion:nil];
}

-(IBAction)login:(id)sender {
    NSString *accountText = [_accountEdit text];
    [_resultLabel setText:accountText];
}

@end
