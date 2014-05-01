//
//  KZBlockerModel.m
//  BlockBreaker
//
//  Created by Kai Zou on 2014-04-30.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import "KZBlockerModel.h"

@implementation KZBlockerModel
@synthesize blocks, ballRect, paddleRect;

-(id)init {
    self = [super init];
    if (self) {
        blocks = [[NSMutableArray alloc] initWithCapacity:20];
        KZBlockView *bv;
        
        for (int row=0; row<=2; row++) {
            for (int col = 0; col<=5; col++) {
                CGRect r = CGRectMake(col*BLOCK_WIDTH, row*BLOCK_WIDTH, BLOCK_WIDTH, BLOCK_HEIGHT);
                bv = [[KZBlockView alloc] initWithFrame:r color:row];
                [blocks addObject:bv];
            }
        }
        
        UIImage *paddleImage = [UIImage imageNamed:@"paddle.png"];
        CGSize paddleSize = [paddleImage size];
        paddleRect = CGRectMake(0, 420, paddleSize.width, paddleSize.height);
        
        UIImage *ballImage = [UIImage imageNamed:@"ball.png"];
        CGSize ballSize = [ballImage size];
        ballRect = CGRectMake(180, 220, ballSize.width, ballSize.height);
        
        self.ballVelocity = CGPointMake(200, -200);
        self.lastTime = 0;
    }
    return self;
}

@end
