//
//  CBJ3DLabelViewController.m
//  Art font Demo
//
//  Created by 超八机 on 2017/9/2.
//  Copyright © 2017年 Hacky. All rights reserved.
//

#import "CBJ3DLabelViewController.h"
#import "CBJ3DLabel.h"

@interface CBJ3DLabelViewController ()

@property (weak, nonatomic) CBJ3DLabel *cbj3DLabel;
@property (weak, nonatomic) IBOutlet UISlider *drawDepthSlider;
@property (weak, nonatomic) IBOutlet UISlider *orientationSlider;

@end

@implementation CBJ3DLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CBJ3DLabel *cbj3DLabel = [[CBJ3DLabel alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100)];
    cbj3DLabel.textAlignment = NSTextAlignmentCenter;
    cbj3DLabel.font = [UIFont systemFontOfSize:60.f];
    cbj3DLabel.text = @"3DTEXT";
    self.cbj3DLabel = cbj3DLabel;
    
    [self.view addSubview:self.cbj3DLabel];
    
    [self.colorView addSegmentControl:@[@"subjectColor",@"bottomBlurColor"]];
    
    [self commonInit];
    
}

- (void)commonInit
{
    [self.orientationSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.drawDepthSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}


- (void)sliderValueChanged:(UISlider *)slider
{
    
    if (slider == self.orientationSlider) {
        
        self.cbj3DLabel.orientation = (NSUInteger)(self.orientationSlider.value + 0.5f);
        
    }else{
        
        self.cbj3DLabel.drawDepth = (NSUInteger)(self.drawDepthSlider.value + 0.5f);
    }
    [self updateInfo];
}

- (void)didSelectColor:(UIColor *)color forKey:(NSString *)key
{
    if ([key isEqualToString:@"subjectColor"]) {
        
        self.cbj3DLabel.subjectColor = color;
        
    }else{
        
        self.cbj3DLabel.bottomBlurColor = color;
        
    }
    [self updateInfo];
}

- (NSString *)getStyleString
{
    NSString *subjColorStr = [self hexStringFromColor:self.cbj3DLabel.subjectColor];
    NSString *bottomBlurColorStr = [self hexStringFromColor:self.cbj3DLabel.bottomBlurColor];
    
    NSString *style = [NSString stringWithFormat:@"3DLabel \n SubJectColor: %@ \n BottomBlurColor: %@ \n Orientation: %lu \n DrawDepth: %lu",subjColorStr, bottomBlurColorStr, (unsigned long)self.cbj3DLabel.orientation, (unsigned long)self.cbj3DLabel.drawDepth];
    return style;
    
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
