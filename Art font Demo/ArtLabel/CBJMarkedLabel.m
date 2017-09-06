//
//  CBJMarkedLabel.m
//  Art font Demo
//
//  Created by 超八机 on 2017/9/2.
//  Copyright © 2017年 Hacky. All rights reserved.
//

#import "CBJMarkedLabel.h"
#import "UIImage+TintColor.h"

@interface CBJMarkedLabel ()
@property (assign, nonatomic) CGFloat strokeWidth;
@end


@implementation CBJMarkedLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self commonInit];
        
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self commonInit];
        
    }
    
    return self;
}

- (void)commonInit
{
    _textureColor = [UIColor blueColor];
    _maskAlpha = 1.0f;
    _randomRange = 20;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (CGFloat)strokeWidth
{
    return self.font.pointSize * 2.5;
}

- (void)drawTextInRect:(CGRect)rect
{
    
    CGFloat minX = CGRectGetMinX(rect);
    CGFloat maxX = CGRectGetMaxX(rect);
    CGFloat midY = CGRectGetMidY(rect);
    
    
    //shift to left
    CGFloat  i = minX - self.strokeWidth/5.f;
    
    if (self.maskTop) {
        
        [super drawTextInRect:rect];
        
    }
    
    //random shade
    do {
        
        [[self.strokeTexture textureWithTintColor:self.textureColor] drawInRect:CGRectMake(i, midY - self.strokeWidth/2.f, self.strokeWidth, self.strokeWidth) blendMode:kCGBlendModeNormal alpha:self.maskAlpha];
        CGFloat random = (((CGFloat) rand() / RAND_MAX) * self.randomRange) + 5;
        i = i + random;
        
    } while (i + self.strokeWidth/2.f < maxX);
    
    if (!self.maskTop){
        
        [super drawTextInRect:rect];
        
    }
    
}

- (void)setStrokeTexture:(UIImage *)strokeTexture
{
    _strokeTexture = strokeTexture;
    [self setNeedsDisplay];
}

- (void)setMaskTop:(BOOL)maskTop
{
    _maskTop = maskTop;
    [self setNeedsDisplay];
}

- (void)setTextureColor:(UIColor *)textureColor
{
    _textureColor = textureColor;
    [self setNeedsDisplay];
}

- (void)setMaskAlpha:(CGFloat)maskAlpha
{
    _maskAlpha = maskAlpha;
    [self setNeedsDisplay];
}

- (void)setRandomRange:(NSUInteger)randomRange
{
    _randomRange = randomRange;
    [self setNeedsDisplay];
}

@end
