//
//  XW_SelfDefineView.h
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/3/31.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface XW_SelfDefineView : GLKView

/**try to self define a single view picture browser*/

- (instancetype)init;

- (void)draw;

- (void)setImage:(NSString *)fileName;

/**方向*/

@property (nonatomic, readonly)GLKVector3 lookVector; //向量轴

@property (nonatomic, readonly) float lookAzimuth; //水平方向 (-π ,π)

@property (nonatomic, readonly) float lookAltitude; //垂直方向(-0.5π,0.5π)

@property (nonatomic) BOOL orientToDevice;

@property (nonatomic) BOOL touchToPan;

- (void) orientToVector:(GLKVector3)vector;

@property (nonatomic, readonly) NSSet *touches;

@property (nonatomic, readonly) NSInteger numberOfTouches;

@property (nonatomic) float fieldOfView;

@property (nonatomic) BOOL pinchToZoom;

@property (nonatomic) BOOL showTouches;

- (CGPoint) screenLocationFromVector:(GLKVector3)vector;

- (GLKVector3) vectorFromScreenLocation:(CGPoint)point;

- (BOOL)touchInRect:(CGRect)rect;

@end
