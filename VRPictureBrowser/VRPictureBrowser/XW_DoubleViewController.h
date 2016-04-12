//
//  XW_DoubleViewController.h
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/4/11.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "PanoramaView.h"

@interface XW_DoubleViewController : GLKViewController{
    
    PanoramaView *leftPanoramaView;
    PanoramaView *rightPanoramaView;
    
}

@property (nonatomic,strong ) NSString *picName;


@end
