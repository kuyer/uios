//
//  ImageViewController.h
//  uios
//
//  Created by rory.zhang on 16/12/24.
//  Copyright © 2016年 rory.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;

-(IBAction)toPrevImage:(id)sender;
-(IBAction)toNextImage:(id)sender;

@end
