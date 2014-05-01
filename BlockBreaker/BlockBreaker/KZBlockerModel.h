//
//  KZBlockerModel.h
//  BlockBreaker
//
//  Created by Kai Zou on 2014-04-30.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KZBlockView.h"

#define BLOCK_HEIGHT 20.0
#define BLOCK_WIDTH 64.0
#define BALL_SIZE 20.0
#define VIEW_WIDTH 320.0
#define VIEW_HEIGHT 460.0

@interface KZBlockerModel : NSObject {

}

@property (readonly) NSMutableArray* blocks;
@property (readonly) CGRect ballRect;
@property CGRect paddleRect;

@property CGPoint ballVelocity;
@property CGFloat lastTime;
@property CGFloat timeDelta;
@end
