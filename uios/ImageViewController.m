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

@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) NSArray *audioArray;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageArray = @[@"01.jpeg", @"02.jpeg", @"03.jpeg", @"04.jpeg", @"05.jpeg"];
    NSInteger imageCount = [_imageArray count];
    [_pageLabel setText:[NSString stringWithFormat:@"%d/%ld", 1, imageCount]];
    
    self.audioArray = @[@"hongyanjiu.mp3",@"meilideshenhua.mp3",@"menghuiyouxian.mp3",@"pianpianxihuanni.mp3",@"qizhi.mp3",@"zhengjiu.mp3"];
    [self prepareAudio:self.audioArray[1]];
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

-(void)prepareAudio:(NSString *)path {
    // 1.设置音频文件的URL路径
    NSURL *url = [[NSBundle mainBundle] URLForResource:path withExtension:Nil];
    // 2.实例化播放器
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:Nil];
    // 3.缓冲
    [_player prepareToPlay];
    // 4.设置音量
    [_player setVolume:0.6];
    // 5.设置当前播放时间
    [_player setCurrentTime:60];
    // 6.设置循环次数
    [_player setNumberOfLoops:2];
}

-(IBAction)randomAudio:(id)sender {
    NSInteger audioCount = [_audioArray count];
    [self prepareAudio:self.audioArray[arc4random()%audioCount]];
    [_player play];
}
-(IBAction)playAudio:(id)sender {
    [_player play];
}
-(IBAction)stopAudio:(id)sender {
    [_player stop];
}
-(IBAction)pauseAudio:(id)sender {
    [_player pause];
}

@end
