//
//  XW_SelfDefineView.m
//  VRPictureBrowser
//
//  Created by chenxingwang on 16/3/31.
//  Copyright © 2016年 PaPaTV.COM. All rights reserved.
//

#import "XW_SelfDefineView.h"
#import <OpenGLES/ES1/gl.h>
#import <GLKit/GLKit.h>

@import CoreMotion;


#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

#define PI 3.1415926535898

#define SENSOR_ORIENTATION [[UIApplication sharedApplication] statusBarOrientation]

GLKQuaternion GLKQuaternionFromTwoVectors(GLKVector3 u, GLKVector3 v){
    GLKVector3 w = GLKVector3CrossProduct(u, v);
    GLKQuaternion q = GLKQuaternionMake(w.x, w.y, w.z, GLKVector3DotProduct(u, v));
    q.w += GLKQuaternionLength(q);
    return GLKQuaternionNormalize(q);
}



@interface Sphere : NSObject

- (bool) execute;

- (instancetype)init:(GLint)slices
              radius:(GLfloat)radius
         textureFile:(NSString *)textureFile;


- (void) swapTexture:(NSString *)textureFile;

- (CGPoint) getTextureSize;

@end


@interface XW_SelfDefineView (){

    Sphere *sphere, *meridians;
    
    CMMotionManager *motionManager;
    
    UIPinchGestureRecognizer *pinchGesture;
    
    UIPanGestureRecognizer *panGesture;
    
    GLKMatrix4 _projectionMatrix, _attitudeMartrix, _offsetMatrix;
    
    float _aspectRatio;
    
    GLfloat circlePonits[64 * 3];


}

@end


@implementation XW_SelfDefineView

- (instancetype)init{

//    CGFloat Height = [[UIScreen mainScreen] bounds].size.height;
//    CGFloat Width = [[UIScreen mainScreen] bounds].size.width;
    
    return [self initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT / 2, SCREEN_WIDTH / 2)];
    
}

- (instancetype)initWithFrame:(CGRect)frame context:(EAGLContext *)context{

    self = [super initWithFrame:frame context:context];
    
    if (self) {
        
        
        
    }
    
    return self;
}

- (void) didMoveToSuperview{

    UIResponder *responder = self;
    while (![responder isKindOfClass:[GLKViewController class]]) {
        
        responder = [responder nextResponder];
        
        if (responder == nil) {
            
            break;
            
        }
        
    }
    
    // 帧率 60FPS
    
    if ([responder respondsToSelector:@selector(setPreferredFramesPerSecond:)]) {
        [(GLKViewController *)responder setPreferredFramesPerSecond:60];
    }
    
}

- (void) initDevice{

    motionManager = [[CMMotionManager alloc] init];
    /**捏合手势*/
    pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHandler:)];
    [pinchGesture setEnabled:NO];
    [self addGestureRecognizer:pinchGesture];
    
    /**平移手势*/
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
    [panGesture setMaximumNumberOfTouches:1];
    [panGesture setEnabled:NO];
    [self addGestureRecognizer:panGesture];
    
}

/**setter 方法*/

- (void) setFieldOfView:(float)fieldOfView{

    _fieldOfView = fieldOfView;

    /**编辑 ProjectionMatrixCode */
    
    [self rebuildProjectionMatrix];
    
}

- (void) setImage:(NSString*)fileName{
    
    [sphere swapTexture:fileName];
    
}

-(void) setTouchToPan:(BOOL)touchToPan{
    _touchToPan = touchToPan;
    [panGesture setEnabled:_touchToPan];
}

-(void) setPinchToZoom:(BOOL)pinchToZoom{
    _pinchToZoom = pinchToZoom;
    [pinchGesture setEnabled:_pinchToZoom];
}


#pragma mark -
#pragma mark - 加载陀螺仪
#pragma mark -


- (void)setOrientToDevice:(BOOL)orientToDevice{

    _orientToDevice = orientToDevice;
    
    if (motionManager.isDeviceMotionAvailable) {
        
        if (_orientToDevice) {
            
            [motionManager startDeviceMotionUpdates];
            
        }else{
        
            [motionManager stopDeviceMotionUpdates];
            
        }
        
    }
    
}


#pragma mark -
#pragma mark - OPENGL ES
#pragma mark -

- (void) initOpenGL:(EAGLContext *)context{
    
    [(CAEAGLLayer *)self.layer setOpaque:NO];
    
    _aspectRatio = self.frame.size.width / self.frame.size.height;

    _fieldOfView = 45 + 45 *atanf(_aspectRatio); // 试试你数学还记得 tan 三角函数不,不懂去查
    
    /**修正 矩阵*/
    
    [self rebuildProjectionMatrix];
    
    _attitudeMartrix = GLKMatrix4Identity;
    
    _offsetMatrix = GLKMatrix4Identity;
    
    /**自定义 GL*/
    
    /**制作 准度线*/
    
    
}

- (void) rebuildProjectionMatrix{

    glMatrixMode(GL_PROJECTION);
    
    glLoadIdentity();
    
    //3.1415926535898 π
    //0.00872664625997
    
    //2π / 180    tan (π / 90)
    
    GLfloat frustum = 0.1f * tanf(_fieldOfView * PI / 180 / 2);
    
    /**?*/
    
    _projectionMatrix = GLKMatrix4MakeFrustum(- frustum, frustum, frustum / _aspectRatio, frustum / _aspectRatio, 0.1f, 0.1);
    
    glMultMatrixf(_projectionMatrix.m);
    
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    
    glMatrixMode(GL_MODELVIEW);
    
    
}

- (void) customGL{

    glMatrixMode(GL_MODELVIEW);
    
    glEnable(GL_BLEND);
    
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
}

- (void) draw{

    static GLfloat whiteColor[] = {1.0f,1.0f,1.0f,1.0f};
    
    static GLfloat clearColor[] = {0.0f,0.0f,0.0f,0.0f};
    
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    
    glClear(GL_COLOR_BUFFER_BIT);
    
    glPushMatrix(); // 设备开始定向;
    
    
        /** 初始位置 设置 */
    
    
    glMultMatrixf(_attitudeMartrix.m);
    
    //全景时 白色
    glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, whiteColor);
    
    [sphere execute];
    
    
    glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, clearColor);
    
    //TODO
    
    
    
    
    
    
    
    
}


#pragma mark -
#pragma mark - 设备定向
#pragma mark -

- (GLKMatrix4) getDeviceOrientationMatrix{

    if (_orientToDevice && [motionManager isDeviceMotionActive]) {
        
        CMRotationMatrix a = [[[motionManager deviceMotion] attitude] rotationMatrix];
        
//        1(NORTH)  2(SOUTH)  3(EAST)  4(WEST)
        
        if (SENSOR_ORIENTATION == 4) {
            
            return GLKMatrix4Make( a.m21, -a.m11,  a.m31, 0.0f,
                                   a.m23, -a.m13,  a.m33, 0.0f,
                                  -a.m22,  a.m12, -a.m32, 0.0f,
                                    0.0f,   0.0f,   0.0f, 1.0f);
            
        }else if (SENSOR_ORIENTATION == 3){
        
            
            return GLKMatrix4Make(-a.m21,  a.m11,  a.m31, 0.0f,
                                   a.m23, -a.m13,  a.m33, 0.0f,
                                   a.m22, -a.m12, -a.m32, 0.0f,
                                    0.0f,   0.0f,   0.0f, 1.0f);
            
        }else if (SENSOR_ORIENTATION == 2){
        
            return GLKMatrix4Make(-a.m11, -a.m21,  a.m31, 0.0f,
                                  -a.m13, -a.m23,  a.m33, 0.0f,
                                   a.m12,  a.m22, -a.m32, 0.0f,
                                    0.0f,   0.0f,   0.0f, 1.0f);
            
        }else if (SENSOR_ORIENTATION == 1){
        
            return GLKMatrix4Make( a.m11,  a.m21, a.m31, 0.0f,
                                   a.m13,  a.m23, a.m33, 0.0f,
                                  -a.m12, -a.m22,-a.m32, 0.0f,
                                   0.0f ,  0.0f , 0.0f , 1.0f);
            
        }
        
    }

    
    return GLKMatrix4Identity;
}


- (void) orientToVector:(GLKVector3)v{
    
    _attitudeMartrix = GLKMatrix4MakeLookAt(0, 0, 0, v.x, v.y, v.z,  0, 1, 0);
    
}

- (void) orientToAzimuth:(float)azimuth Altitude:(float)altitude{
    
    [self orientToVector:GLKVector3Make(-cosf(azimuth), sinf(altitude), sinf(azimuth))];
    
}

- (void) updateLook{

    _lookVector = GLKVector3Make(-_attitudeMartrix.m02,
                                 -_attitudeMartrix.m12,
                                 -_attitudeMartrix.m22);
    _lookAzimuth = atan2f(_lookVector.x, -_lookVector.z);
    _lookAltitude = asinf(_lookVector.y);
    
}






@end









