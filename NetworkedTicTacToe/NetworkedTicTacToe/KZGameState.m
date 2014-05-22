//
//  KZGameState.m
//  NetworkedTicTacToe
//
//  Created by Kai Zou on 2014-05-21.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import "KZGameState.h"

@implementation KZGameState
@synthesize playersTurn, boardState;

-(id)init {
    self = [super init];
    if (self) {
        boardState = [[NSMutableArray alloc] initWithCapacity:9];
        playersTurn = TTxPlayerTurn;
    }
    return self;
}

#pragma mark - NSCoding protocol
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:boardState forKey:@"BoardState"];
    [aCoder encodeInt:playersTurn forKey:@"PlayersTurn"];
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    boardState = [aDecoder decodeObjectForKey:@"BoardState"];
    playersTurn = [aDecoder decodeIntForKey:@"PlayersTurn"];
    return self;
}

@end
