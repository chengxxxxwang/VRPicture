//
//  XW_DoubleEyesViewController.m
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/4/6.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "XW_DoubleEyesViewController.h"

@interface XW_DoubleEyesViewController ()

@end

@implementation XW_DoubleEyesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (!self.picName) {
        self.picName = @"4.jpg";
    }
    
    [self layoutPanoramaView];
    
}

- (void)layoutPanoramaView{
    
    _leftView = [[PanoramaView alloc] init];
    
    [_leftView setImage:_picName];
    
    [_leftView setOrientToDevice:YES];
    
    [_leftView setTouchToPan:YES];
    
    [_leftView setPinchToZoom:YES];
    
    [_leftView setShowTouches:NO];
    
    //    [self setView:panoramaView];
    
    self.view = _leftView;
    
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
    [_leftView draw];
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
