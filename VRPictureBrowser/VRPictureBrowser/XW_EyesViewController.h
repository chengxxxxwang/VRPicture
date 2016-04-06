

#import <GLKit/GLKit.h>

@interface XW_EyesViewController : GLKViewController

@property (weak, nonatomic) IBOutlet GLKView *leftEyeVisionView;
@property (weak, nonatomic) IBOutlet GLKView *rightEyeVisionView;
@property (weak, nonatomic) IBOutlet UIView *midView;

@end
