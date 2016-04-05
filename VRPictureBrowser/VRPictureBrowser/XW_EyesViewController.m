//
//  XW_EyesViewController.m
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/3/30.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "XW_EyesViewController.h"
#import "PanoramaView.h"


@interface XW_EyesViewController (){

    PanoramaView *leftPanoramaView;
    PanoramaView *rightPanoramaView;

}

@end

@implementation XW_EyesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self layoutLeftView];
    [self layoutRightView];
    
    self.view.userInteractionEnabled = YES;
    
}

- (void)layoutLeftView{
    
    CGRect frame = self.leftEyeVisionView.frame;
    
    leftPanoramaView = [[PanoramaView alloc] initWithFrame:frame];
    
    leftPanoramaView.center = self.leftEyeVisionView.center;
    
    [leftPanoramaView setImage:@"1.jpg"];
    [leftPanoramaView setOrientToDevice:YES];
    [leftPanoramaView setTouchToPan:YES];
    [leftPanoramaView setPinchToZoom:YES];
    [leftPanoramaView setShowTouches:YES];
    
    [self.leftEyeVisionView addSubview:leftPanoramaView];
    

    
}

- (void)layoutRightView{

    CGRect frame = self.rightEyeVisionView.frame;
    
    rightPanoramaView = [[PanoramaView alloc] initWithFrame:frame];
    
    rightPanoramaView.center = self.rightEyeVisionView.center;
    
    [rightPanoramaView setImage:@"1.jpg"];
    [rightPanoramaView setOrientToDevice:YES];
    [rightPanoramaView setTouchToPan:YES];
    [rightPanoramaView setPinchToZoom:YES];
    [rightPanoramaView setShowTouches:YES];
    
    [self.rightEyeVisionView addSubview:rightPanoramaView];
    
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
