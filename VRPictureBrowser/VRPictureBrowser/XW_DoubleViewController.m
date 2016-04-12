//
//  XW_DoubleViewController.m
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/4/11.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "XW_DoubleViewController.h"

@interface XW_DoubleViewController ()

@end

@implementation XW_DoubleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    [self layoutPanoramaView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (!self.picName) {
        self.picName = @"4.jpg";
    }
    
}

- (void)layoutPanoramaView{
    
    GLKView *leftView = [[GLKView alloc] init];
    leftView.frame = CGRectMake(0, 0, 290, 290);
    leftView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:leftView];
    
    leftPanoramaView = [[PanoramaView alloc] init];
    [leftPanoramaView setImage:_picName];
    [leftPanoramaView setOrientToDevice:YES];
    [leftPanoramaView setTouchToPan:YES];
    [leftPanoramaView setPinchToZoom:YES];
    [leftPanoramaView setShowTouches:YES];
    
    
    [leftView addSubview:leftPanoramaView];
    [leftView setUserInteractionEnabled:YES];
    
    leftView = leftPanoramaView;
    leftView.delegate = self;
    
    
    GLKView *rightView = [[GLKView alloc] init];
    rightView.frame = CGRectMake(0, 365, 290, 290);
    [self.view addSubview:rightView];
    
    rightPanoramaView = [[PanoramaView alloc] init];
    
    [rightPanoramaView setImage:_picName];
    [rightPanoramaView setOrientToDevice:YES];
    [rightPanoramaView setTouchToPan:YES];
    [rightPanoramaView setPinchToZoom:YES];
    [rightPanoramaView setShowTouches:YES];
    [rightView addSubview:rightPanoramaView];
    
    
    rightView = rightPanoramaView;
    rightView.delegate = self;
    
    
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
    if ([view isEqual:[GLKView class]]) {
        
        [leftPanoramaView draw];
        [rightPanoramaView draw];
        
    }
    
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

@end
