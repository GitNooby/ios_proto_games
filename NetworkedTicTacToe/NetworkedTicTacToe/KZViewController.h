//
//  KZViewController.h
//  NetworkedTicTacToe
//
//  Created by Kai Zou on 2014-05-21.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZGameState.h"
#import <GameKit/GameKit.h>

typedef enum {
    TTMyShapeUndefined = 0,
    TTMyShapeX = 1,
    TTMyShapeO = 2
} TTMyShape;

typedef enum {
    TTGameNotOver = 0,
    TTGameOverxWins = 1,
    TTGameOveroWins = 2,
    TTGameOverTie = 3
} TTGameOverStatus;

@interface KZViewController : UIViewController <GKPeerPickerControllerDelegate> {
    UIImage *xImage;
    UIImage *oImage;
    KZGameState *theGameState;
    
    TTMyShape myShape;
    NSString *myUUID;
    GKSession *theSession;
    NSString *myPeerID;
}
@property (strong, nonatomic) UIImage *xImage;
@property (strong, nonatomic) UIImage *oImage;
@property (strong, nonatomic) KZGameState *theGameState;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *spaceButton;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerLabel;

@property TTMyShape myShape;
@property (strong, nonatomic) NSString *myUUID;
@property (strong, nonatomic) IBOutlet GKSession *theSession;
@property (strong, nonatomic) IBOutlet NSString *myPeerID;

- (IBAction)spaceButtonPressed:(UIButton *)sender;
-(void)initGame;
-(void)updateBoard;
-(void)updateGameStatus;
-(TTGameOverStatus)checkGameOver;
-(BOOL)didPlayerWin:(NSString*)player;
-(void)endGameWithResult:(TTGameOverStatus)result;
-(NSString*)getUUIDString;

@end
