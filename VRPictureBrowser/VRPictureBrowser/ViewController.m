

#import "ViewController.h"
#import "XW_ViewController.h"
#import "XW_EyesViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "XW_DoubleEyesViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@property (nonatomic) CMMotionManager *motionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [self.pictureImageView addGestureRecognizer:tap];
    
    self.motionManager = [[CMMotionManager alloc] init];
    
    self.pictureImageView.userInteractionEnabled = YES;
    
    [self MotionMoved];
    
}

- (void)MotionMoved{

    CMAccelerometerData *accelerometerData = _motionManager.accelerometerData;
    
    CGFloat accelerometerX = accelerometerData.acceleration.x;
    CGFloat accelerometerY = accelerometerData.acceleration.y;
    CGFloat accelerometerZ = accelerometerData.acceleration.z;
    
    NSLog(@"%f,%f,%f",accelerometerX,accelerometerY,accelerometerZ);
    
    
}

- (void)tapAction{

    NSLog(@"被点击了");
    
//    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    
////    XW_EyesViewController *EyesVC = [Main instantiateViewControllerWithIdentifier:@"XW_EyesViewController"];
////    
////    [self presentViewController:EyesVC animated:YES completion:nil];
    
    XW_DoubleEyesViewController  *DEVC = [XW_DoubleEyesViewController new];
    
    DEVC.picName = [NSString stringWithFormat:@"%ld.jpg",_index];
    
    [self presentViewController:DEVC animated:YES completion:nil];
    
    
    
}

- (IBAction)showPicturesButton:(id)sender {
    
    [self NestPic];
    
    [self MotionMoved];
}

- (void)NestPic{
    
    if (_index >= 11) {
        _index = 1;
    }
    
    [self pickImageWithNumber:_index];
    
    _index++;
    
}

- (void)pickImageWithNumber:(NSInteger)number{
    
    NSString *num = [NSString stringWithFormat:@"%ld.jpg",number];
    NSLog(@"%@",num);
    
    [self showImageViewWithName:num];
}

- (void)showImageViewWithName:(NSString *)name{

    self.pictureImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",name]];
    
}



- (IBAction)showPanoramaView:(id)sender {
    
    XW_ViewController *panoramaView = [XW_ViewController new];
    
    panoramaView.picName = [NSString stringWithFormat:@"%ld.jpg",_index - 1];
    
    [self.navigationController pushViewController:panoramaView animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
