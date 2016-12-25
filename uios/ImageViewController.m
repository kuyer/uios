//
//  ImageViewController.m
//  uios
//
//  Created by rory.zhang on 16/12/24.
//  Copyright © 2016年 rory.zhang. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property NSArray *imageArray;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageArray = @[@"01.jpeg", @"02.jpeg", @"03.jpeg", @"04.jpeg", @"05.jpeg"];
    NSInteger imageCount = [_imageArray count];
    [_pageLabel setText:[NSString stringWithFormat:@"%d/%ld", 1, imageCount]];
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

-(IBAction)toPrevImage:(id)sender {
    NSInteger currentIndex = [[[_pageLabel text] substringToIndex:1] integerValue];
    NSInteger imageCount = [_imageArray count];
    if(currentIndex <= 1) {
        currentIndex = imageCount;
    } else {
        currentIndex = currentIndex - 1;
    }
    [_pageLabel setText:[NSString stringWithFormat:@"%ld/%ld", currentIndex, imageCount]];
    NSString *imageName = [NSString stringWithFormat:@"0%ld.jpeg", currentIndex];
    NSLog(@"to prev image. current image: %@.", imageName);
    UIImage *image = [UIImage imageNamed:imageName];
    [_imageView setImage:image];
}
-(IBAction)toNextImage:(id)sender {
    NSInteger currentIndex = [[[_pageLabel text] substringToIndex:1] integerValue];
    NSInteger imageCount = [_imageArray count];
    if(currentIndex>=imageCount) {
        currentIndex = 1;
    } else {
        currentIndex = currentIndex + 1;
    }
    [_pageLabel setText:[NSString stringWithFormat:@"%ld/%ld", currentIndex, imageCount]];
    NSString *imageName = [NSString stringWithFormat:@"0%ld.jpeg", currentIndex];
    NSLog(@"to next image. current image: %@.", imageName);
    UIImage *image = [UIImage imageNamed:imageName];
    [_imageView setImage:image];
}

@end
