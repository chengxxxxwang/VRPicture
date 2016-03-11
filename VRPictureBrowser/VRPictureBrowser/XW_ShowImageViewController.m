//
//  XW_ShowImageViewController.m
//  VRPictureBrowser
//
//  Created by apple on 16/3/1.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "XW_ShowImageViewController.h"


@interface XW_ShowImageViewController (){

    PanoramaView *panoramaView;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation XW_ShowImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)pickimageButton:(id)sender {
    
    panoramaView = [[PanoramaView alloc] init];
    [panoramaView setImage:@"park_2048.jpg"];
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
