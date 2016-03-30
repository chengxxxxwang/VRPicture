//
//  XW_ViewController.m
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/3/11.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "XW_ViewController.h"
#import "PanoramaView.h"

@interface XW_ViewController (){
    PanoramaView *panoramaView;
}

@end

@implementation XW_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    [self layoutPanoramaView];
    
}


#pragma mark -
#pragma mark - panoramaView
#pragma mark -

- (void)layoutPanoramaView{

    panoramaView = [[PanoramaView alloc] init];
    [panoramaView setImage:_picName];
    [panoramaView setOrientToDevice:YES];
    [panoramaView setTouchToPan:NO];
    [panoramaView setPinchToZoom:YES];
    [panoramaView setShowTouches:NO];
    [self setView:panoramaView];
    
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [panoramaView draw];
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
