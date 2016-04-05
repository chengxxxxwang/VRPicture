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

    PanoramaView *panoramaView;

}

@end

@implementation XW_EyesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self layoutLeftView];
    [self layoutRightView];
    
}

- (void)layoutLeftView{

    panoramaView = [[PanoramaView alloc] init];
    [panoramaView setImage:@"1.jpg"];
    [panoramaView setOrientToDevice:YES];
    [panoramaView setTouchToPan:YES];
    [panoramaView setPinchToZoom:YES];
    [panoramaView setShowTouches:NO];
//    [self setView:panoramaView];

//    [self.leftEyeVisionView setMaskView:panoramaView];
    
    [self.leftEyeVisionView addSubview:panoramaView];
    
    
}

- (void)layoutRightView{

    panoramaView = [[PanoramaView alloc] init];
    [panoramaView setImage:@"1.jpg"];
    [panoramaView setOrientToDevice:YES];
    [panoramaView setTouchToPan:YES];
    [panoramaView setPinchToZoom:YES];
    [panoramaView setShowTouches:NO];
    //    [self setView:panoramaView];
    
//    [self.rightEyeVisionView setMaskView:panoramaView];
    
    [self.rightEyeVisionView addSubview:panoramaView];
    
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
