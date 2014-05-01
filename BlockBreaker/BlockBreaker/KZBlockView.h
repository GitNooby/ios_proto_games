//
//  KZBlockView.h
//  BlockBreaker
//
//  Created by Kai Zou on 2014-04-30.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RED_COLOR 0
#define GREEN_COLOR 1
#define BLUE_COLOR 2

@interface KZBlockView : UIView
@property (assign, nonatomic) int color;

-(id)initWithFrame:(CGRect)frame color:(int)inputColor;

@end
