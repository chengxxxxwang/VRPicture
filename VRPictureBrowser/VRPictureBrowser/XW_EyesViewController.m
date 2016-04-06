

#import "XW_EyesViewController.h"
#import "PanoramaView.h"
#import "XW_ViewController.h"
#import "ViewController.h"

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
    
    [self layoutLeftView];
    [self layoutRightView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(returnToFrontView)];
    
    [self.midView addGestureRecognizer:tap];
    
    self.view.userInteractionEnabled = YES;
    
}

- (void)returnToFrontView{

    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"ViewController"];
    
    UINavigationController *Navc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:Navc animated:YES completion:nil];
    
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
    
    CGSize size = self.leftEyeVisionView.frame.size;
    CGRect frame = CGRectZero;
    frame.size = size;
    leftPanoramaView = [[PanoramaView alloc] initWithFrame:frame];
    
    [leftPanoramaView setImage:@"3.jpg"];
    [leftPanoramaView setOrientToDevice:YES];
    [leftPanoramaView setTouchToPan:YES];
    [leftPanoramaView setPinchToZoom:YES];
    [leftPanoramaView setShowTouches:YES];
    [leftPanoramaView draw];

    [self.leftEyeVisionView addSubview:leftPanoramaView];
    

}

- (void)layoutRightView{
    
    [self.rightEyeVisionView layoutIfNeeded];

    CGRect frame = CGRectZero;
    CGSize size = self.rightEyeVisionView.frame.size;
    frame.size = size;
    rightPanoramaView = [[PanoramaView alloc] initWithFrame:frame];
    
    [rightPanoramaView setImage:@"5.jpg"];
    [rightPanoramaView setOrientToDevice:YES];
    [rightPanoramaView setTouchToPan:YES];
    [rightPanoramaView setPinchToZoom:YES];
    [rightPanoramaView setShowTouches:YES];
    [rightPanoramaView draw];
    
    [self.rightEyeVisionView addSubview:rightPanoramaView];


}

/**test rightview positon draw*/

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{

    if ([view isEqual:self.leftEyeVisionView]) {
        
        [leftPanoramaView draw];
        
    }else{
    
        [rightPanoramaView draw];
        
    }
    
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
