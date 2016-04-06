//
//  XW_selfDefineView.h
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/4/6.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//


#import <GLKit/GLKit.h>
#import "PanoramaView.h"

@interface XW_selfDefineView : PanoramaView{
    PanoramaView *panoramaView;
}
@property (assign ,nonatomic) CGRect frame;

@end
