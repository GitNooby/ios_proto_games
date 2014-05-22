//
//  KZViewController.h
//  CoreAnimateTests
//
//  Created by Kai Zou on 2014-05-01.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define SHIP1_WIDTH 337
#define SHIP1_HEIGHT 125
#define SHIP2_WIDTH 337
#define SHIP2_HEIGHT 116
#define SHIP3_WIDTH 340
#define SHIP3_HEIGHT 169

@interface KZViewController : UIViewController {
    CALayer *ship1, *ship2, *ship3;
    BOOL alternate;
}
-(void)addShipLayers;
-(void)returnShipsToDefaultState;
-(void)handletap:(UIGestureRecognizer*)gestureRecognizer;

@end
