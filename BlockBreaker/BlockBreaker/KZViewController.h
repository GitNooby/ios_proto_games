//
//  KZViewController.h
//  BlockBreaker
//
//  Created by Kai Zou on 2014-04-30.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZBlockView.h"
#import "KZBlockerModel.h"

@interface KZViewController : UIViewController
@property (strong, nonatomic) KZBlockerModel *gameModel;
@property (strong, nonatomic) UIImageView* ball;
@property (strong, nonatomic) UIImageView* paddle;

@end
