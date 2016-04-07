

#import <GLKit/GLKit.h>

#import "PanoramaView.h"


@interface XW_EyesViewController : GLKViewController{
    
    PanoramaView *leftPanoramaView;
    PanoramaView *rightPanoramaView;
    
}


@property (weak, nonatomic  ) IBOutlet GLKView  *leftEyeVisionView;
@property (weak, nonatomic  ) IBOutlet GLKView  *rightEyeVisionView;
@property (weak, nonatomic  ) IBOutlet UIView   *midView;
@property (strong ,nonatomic) NSString *picName;


@end
