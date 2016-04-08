

#import <GLKit/GLKit.h>

#import "PanoramaView.h"


@interface XW_EyesViewController : GLKViewController

@property (strong ,nonatomic) NSString *imageName;
@property (weak, nonatomic  ) IBOutlet GLKView  *leftEyeVisionView;
@property (weak, nonatomic  ) IBOutlet GLKView  *rightEyeVisionView;
@property (weak, nonatomic  ) IBOutlet UIView   *midView;

@end
