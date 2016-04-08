




#import "XW_ViewController.h"
#import "PanoramaView.h"

@interface XW_ViewController (){
    PanoramaView *panoramaView;
}

@end

@implementation XW_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    if (!self.picName) {
        self.picName = @"4.jpg";
    }
    
    [self layoutPanoramaView];
    
}


#pragma mark -
#pragma mark - panoramaView
#pragma mark -


//FIXME: 单一修改frame后视图产生形变 其他功能不受影响

- (void)layoutPanoramaView{

    panoramaView = [[PanoramaView alloc] init];
    
//    panoramaView.frame = CGRectMake(600, 100, 80, 80);
    
    [panoramaView setImage:_picName];
   
    [panoramaView setOrientToDevice:YES];
    
    [panoramaView setTouchToPan:YES];
    
    [panoramaView setPinchToZoom:YES];
    
    [panoramaView setShowTouches:NO];
    
//    [self setView:panoramaView];
    
    self.view = panoramaView;
    
    //TODO: 设置imageframe
    
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
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
