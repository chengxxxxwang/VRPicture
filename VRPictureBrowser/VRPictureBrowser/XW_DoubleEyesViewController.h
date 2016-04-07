//
//  XW_DoubleEyesViewController.h
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/4/6.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import <GLKit/GLKit.h>

#import "PanoramaView.h"



@interface XW_DoubleEyesViewController : GLKViewController

@property (nonatomic,strong) NSString *picName;

@property (strong, nonatomic) IBOutlet  PanoramaView *leftView;

@property (strong, nonatomic) IBOutlet  PanoramaView *rightView;

@property (weak, nonatomic) IBOutlet UIView *midLine;

@end
