//
//  XW_selfDefineView.m
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/4/6.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "XW_selfDefineView.h"


@implementation XW_selfDefineView


-(id)init{

    if (self = [super init]) {
        
        self.maskView.frame = self.frame;
        
    }
    return self;
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [panoramaView draw];
}


@end
