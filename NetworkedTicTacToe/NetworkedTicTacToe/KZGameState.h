//
//  KZGameState.h
//  NetworkedTicTacToe
//
//  Created by Kai Zou on 2014-05-21.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TTxPlayerTurn = 1,
    TToPlayerTurn = 2
} TTPlayerTurn;

@interface KZGameState : NSObject <NSCoding> {
    TTPlayerTurn playersTurn;
    NSMutableArray *boardState;
}
@property TTPlayerTurn playersTurn;
@property (strong, nonatomic) NSMutableArray *boardState;

@end
