//
//  ViewController.m
//  VRPictureBrowser
//
//  Created by apple on 16/3/1.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [self.pictureImageView addGestureRecognizer:tap];
    
    self.pictureImageView.userInteractionEnabled = YES;
}

- (void)tapAction{

    NSLog(@"被点击了");
    
}

- (IBAction)showPicturesButton:(id)sender {
    
    [self NestPic];
    
}

- (void)NestPic{
    
    if (_index >= 4) {
        _index = 0;
    }
    
    [self pickImageWithNumber:_index];
    
    _index++;
    
}

- (void)pickImageWithNumber:(NSInteger)number{
    
    NSString *num = [NSString stringWithFormat:@"%ld.jpg",number];
    NSLog(@"%@",num);
    
    [self showImageViewWithName:num];
}

- (void)showImageViewWithName:(NSString *)name{

    self.pictureImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",name]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
