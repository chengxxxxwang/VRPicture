

#import "XW_EyesViewController.h"
#import "PanoramaView.h"
#import "XW_ViewController.h"

@interface XW_EyesViewController (){

    PanoramaView *leftPanoramaView;
    PanoramaView *rightPanoramaView;
    
    XW_ViewController *leftView;
    XW_ViewController *rightView;
}

@end

@implementation XW_EyesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self layoutLeftView];
    [self layoutRightView];
 

    
    
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
//    rightView = [XW_ViewController new];
//    rightView.picName = @"4.jpg";
//    rightView.view.frame = rightPanoramaView.frame;
//    [self addChildViewController:rightView];
//
//    
//    leftView = [XW_ViewController new];
//    leftView.picName = @"4.jpg";
//    leftView.view.frame = leftPanoramaView.frame;
//    [self addChildViewController:leftView];
    
    
}

//- (void)layoutPanoramaView{
//    
//    panoramaView = [[PanoramaView alloc] init];
//    [panoramaView setImage:_picName];
//    [panoramaView setOrientToDevice:YES];
//    [panoramaView setTouchToPan:NO];
//    [panoramaView setPinchToZoom:YES];
//    [panoramaView setShowTouches:NO];
//    [self setView:panoramaView];
//    
//}

- (void)layoutLeftView{
    
    CGRect frame = self.leftEyeVisionView.frame;
    
    
    
    leftPanoramaView = [[PanoramaView alloc] initWithFrame:frame];
    
    leftPanoramaView.center = self.leftEyeVisionView.center;
    
    [leftPanoramaView setImage:@"2.jpg"];
    [leftPanoramaView setOrientToDevice:YES];
    [leftPanoramaView setTouchToPan:YES];
    [leftPanoramaView setPinchToZoom:YES];
    [leftPanoramaView setShowTouches:YES];
    
    [self.leftEyeVisionView addSubview:leftPanoramaView];
    
}

- (void)layoutRightView{

    CGRect frame = self.rightEyeVisionView.frame;
    
    rightPanoramaView = [[PanoramaView alloc] initWithFrame:frame];
    
    rightPanoramaView.center = self.rightEyeVisionView.center;
    
    [rightPanoramaView setImage:@"1.jpg"];
    [rightPanoramaView setOrientToDevice:YES];
    [rightPanoramaView setTouchToPan:YES];
    [rightPanoramaView setPinchToZoom:YES];
    [rightPanoramaView setShowTouches:YES];
    
    [self.rightEyeVisionView addSubview:rightPanoramaView];
    
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
