//
//  ViewController.h
//  uios
//
//  Created by rory.zhang on 16/12/24.
//  Copyright © 2016年 rory.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *accountEdit;
@property (weak, nonatomic) IBOutlet UITextField *passwordEdit;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

-(IBAction)changeColor:(id)sender;
-(IBAction)login:(id)sender;

@end

