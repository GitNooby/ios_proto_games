//
//  KZBlockView.m
//  BlockBreaker
//
//  Created by Kai Zou on 2014-04-30.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import "KZBlockView.h"

@implementation KZBlockView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame color:(int)inputColor {
    self = [super initWithFrame:frame];
    if (self) {
        self.color = inputColor;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    float viewWidth, viewHeight;
    viewWidth = self.bounds.size.width;
    viewHeight = self.bounds.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect blockRect = CGRectMake(0, 0, viewWidth, viewHeight);
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:blockRect];
    
    path.lineWidth = 2;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef myGradient;
    int num_locations = 2;
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0};
    
    if (self.color == RED_COLOR) {
        components[0] = 1.0;
    } else if (self.color == GREEN_COLOR) {
        components[1] = 1.0;
    } else if (self.color == BLUE_COLOR) {
        components[2] = 1.0;
    }
    
    myGradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, num_locations);
    
    CGContextDrawLinearGradient(context, myGradient, CGPointMake(0, 0), CGPointMake(viewWidth, 0), 0);
    
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(myGradient);
    [path stroke];
}

@end
