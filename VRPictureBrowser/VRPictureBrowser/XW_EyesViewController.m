

#import "XW_EyesViewController.h"
#import "XW_ViewController.h"
#import "ViewController.h"
@import CoreMotion;
@interface XW_EyesViewController (){
    
    PanoramaView *leftPanoramaView;
    PanoramaView *rightPanoramaView;
    
    PanoramaView *panoramaView;
    
}

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
    
    //FIXME: 使用MainstoryBoard创建view 会导致页面跳转UITransition 无法释放 分支修改为 xib 或者纯代码模式
    
//    panoramaView = [[PanoramaView alloc] init];
//    [panoramaView setImage:_imageName];
//    [panoramaView setOrientToDevice:YES];
//    [panoramaView setTouchToPan:YES];
//    [panoramaView setPinchToZoom:YES];
//    [panoramaView setShowTouches:NO];
//    
//    
//    
//    leftPanoramaView = panoramaView;
//    rightPanoramaView = panoramaView;
//    
//    
//    leftPanoramaView.delegate = self;
//    rightPanoramaView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(returnToFrontView)];
    
    [self.midView addGestureRecognizer:tap];
    
    self.view.userInteractionEnabled = YES;
    
    
    
}

- (void)returnToFrontView{

    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"ViewController"];
    
//    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *Navc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:Navc animated:YES completion:nil];
    
}

- (void)layoutLeftView{
    
//    CGSize size = self.leftEyeVisionView.frame.size;
//    CGRect frame = CGRectZero;
//    frame.size = size;
    
    leftPanoramaView = [[PanoramaView alloc] init];
    [leftPanoramaView setImage:_imageName];
    [leftPanoramaView setOrientToDevice:YES];
    
//    [leftPanoramaView setTouchToPan:YES];
//    [leftPanoramaView setPinchToZoom:YES];
//    [leftPanoramaView setShowTouches:YES];

    
    [self.leftEyeVisionView addSubview:leftPanoramaView];
    
    self.leftEyeVisionView = leftPanoramaView;
    [leftPanoramaView draw];
    
    //???: 设置代理之后只执行了draw命令一次 bug??

    self.leftEyeVisionView.delegate = self;

}

- (void)layoutRightView{
    
    [self.rightEyeVisionView layoutIfNeeded];

//    CGRect frame = CGRectZero;
//    CGSize size = self.rightEyeVisionView.frame.size;
//    frame.size = size;
    
    //TODO: 加载陀螺仪
    //!!!: 加载陀螺仪任务
    
    rightPanoramaView = [[PanoramaView alloc] init];
    [rightPanoramaView setImage:_imageName];
    [rightPanoramaView setOrientToDevice:YES];
    
//    [rightPanoramaView setTouchToPan:YES];
//    [rightPanoramaView setPinchToZoom:YES];
//    [rightPanoramaView setShowTouches:YES];
    
    [self.rightEyeVisionView addSubview:rightPanoramaView];

    self.rightEyeVisionView = rightPanoramaView;
    [rightPanoramaView draw];

    self.rightEyeVisionView.delegate = self;

}

/**test rightview positon draw*/

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
    

    if ([view isEqual:self.leftEyeVisionView]) {
        
        [leftPanoramaView draw];
        
    }else{
    
        [rightPanoramaView draw];
        
    }
    
    [panoramaView draw];
    
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
