//
//  GlowLabelViewController.m
//  Art font Demo
//
//  Created by 超八机 on 2017/9/2.
//  Copyright © 2017年 Hacky. All rights reserved.
//

#import "GlowLabelViewController.h"
#import "CBJGlowLabel.h"

@interface GlowLabelViewController ()

@property (weak, nonatomic) CBJGlowLabel *glowLabel;
@property (weak, nonatomic) IBOutlet UISlider *glowSizeSlider;

@end

@implementation GlowLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.colorView addSegmentControl:@[@"GlowColor",@"FontColor"]];
    
    CBJGlowLabel *glowLabel = [[CBJGlowLabel alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100)];
    glowLabel.textAlignment = NSTextAlignmentCenter;
    glowLabel.font = [UIFont systemFontOfSize:60.f];
    glowLabel.text = @"GLOW";
    self.glowLabel = glowLabel;
    
    [self.view addSubview:self.glowLabel];
    
    self.glowSizeSlider.value = glowLabel.glowSize;
    [self.glowSizeSlider addTarget:self action:@selector(slideValueChange:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)slideValueChange:(UISlider *)slider
{
    self.glowLabel.glowSize = slider.value;
    [self updateInfo];
}

- (void)didSelectColor:(UIColor *)color forKey:(NSString *)key
{
    if ([key isEqualToString:@"GlowColor"]) {
        
        self.glowLabel.glowColor = color;
        
    }else{
        
        self.glowLabel.textColor = color;
        
    }
    [self updateInfo];
}

- (NSString *)getStyleString
{
    NSString *glowColor = [self hexStringFromColor:self.glowLabel.glowColor];
    NSString *textColor = [self hexStringFromColor:self.glowLabel.textColor];
    NSString *style = [NSString stringWithFormat:@"GlowLabel \n GlowColor: %@ \n FontColor: %@ \n GlowSize: %f", glowColor, textColor, self.glowLabel.glowSize];
    return style;
    
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
