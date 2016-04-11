//
//  XW_DoubleEyesViewController.m
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/4/6.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "XW_DoubleEyesViewController.h"

@interface XW_DoubleEyesViewController (){
    
    PanoramaView *leftPanoramaView;
    PanoramaView *rightPanoramaView;
    
}

@end

@implementation XW_DoubleEyesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self layoutPanoramaView];
    

}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (!self.picName) {
        self.picName = @"4.jpg";
    }
    
    [self layoutPanoramaView];
    
}

- (void)layoutPanoramaView{
    
    leftPanoramaView = [[PanoramaView alloc] init];
    [leftPanoramaView setImage:_picName];
    [leftPanoramaView setOrientToDevice:YES];
    [leftPanoramaView setTouchToPan:YES];
    [leftPanoramaView setPinchToZoom:YES];
    [leftPanoramaView setShowTouches:YES];
    
    
    [self.leftView addSubview:leftPanoramaView];
    [self.leftView setUserInteractionEnabled:YES];
    
    self.leftView = leftPanoramaView;
    self.leftView.delegate = self;
    
    
    rightPanoramaView = [[PanoramaView alloc] init];
    
    [rightPanoramaView setImage:_picName];
    [rightPanoramaView setOrientToDevice:YES];
    [rightPanoramaView setTouchToPan:YES];
    [rightPanoramaView setPinchToZoom:YES];
    [rightPanoramaView setShowTouches:YES];
    [self.rightView addSubview:rightPanoramaView];

    
    self.rightView = rightPanoramaView;
    self.rightView.delegate = self;

    
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
 
        [rightPanoramaView draw];

        [leftPanoramaView draw];

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
