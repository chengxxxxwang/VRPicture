

#import "XW_EyesViewController.h"
#import "XW_ViewController.h"
#import "ViewController.h"

@interface XW_EyesViewController ()<GLKViewDelegate>

@end

@implementation XW_EyesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
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

- (void)layoutLeftView{
    
    
    //FIXME:  fix image size
    
    
    CGSize size = self.leftEyeVisionView.frame.size;
    CGRect frame = CGRectZero;
    frame.size = size;
    
    leftPanoramaView = [[PanoramaView alloc] init];
    [leftPanoramaView setImage:_picName];
    [leftPanoramaView setOrientToDevice:YES];
    [leftPanoramaView setTouchToPan:YES];
    [leftPanoramaView setPinchToZoom:YES];
    [leftPanoramaView setShowTouches:YES];

    
    [self.leftEyeVisionView addSubview:leftPanoramaView];
    
    [self.leftEyeVisionView setUserInteractionEnabled:YES];
    
    self.leftEyeVisionView = leftPanoramaView;    
    self.leftEyeVisionView.delegate = self;

}

- (void)layoutRightView{
    
    [self.rightEyeVisionView layoutIfNeeded];

    CGRect frame = CGRectZero;
    CGSize size = self.rightEyeVisionView.frame.size;
    frame.size = size;
    
    rightPanoramaView = [[PanoramaView alloc] init];
    [rightPanoramaView setImage:_picName];
    [rightPanoramaView setOrientToDevice:YES];
    [rightPanoramaView setTouchToPan:YES];
    [rightPanoramaView setPinchToZoom:YES];
    [rightPanoramaView setShowTouches:YES];
    
    [self.rightEyeVisionView addSubview:rightPanoramaView];

    self.rightEyeVisionView = rightPanoramaView;
    self.rightEyeVisionView.delegate = self;

}


//???: why refresh once 


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
