//
//  KZViewController.m
//  NetworkedTicTacToe
//
//  Created by Kai Zou on 2014-05-21.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import "KZViewController.h"

@interface KZViewController () <UIAlertViewDelegate>

@end

@implementation KZViewController
@synthesize xImage, oImage, theGameState, myShape, myUUID;
@synthesize theSession, myPeerID;

- (void)viewDidLoad {
    [super viewDidLoad];
    xImage = [UIImage imageNamed:@"x.png"];
    oImage = [UIImage imageNamed:@"o.png"];
    theGameState = [[KZGameState alloc] init];
    
    myShape = TTMyShapeUndefined;
    myUUID = [self getUUIDString];
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    GKPeerPickerController *picker = [[GKPeerPickerController alloc] init];
    picker.delegate = self;
    [picker show];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initGame];
}

-(NSString*)getUUIDString {
    NSString * result;
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
    result = [NSString stringWithFormat:@"%@", uuidStr];
    CFRelease(uuidStr);
    CFRelease(uuid);
    return result;
}

-(void)initGame {
    self.theGameState.playersTurn = TTxPlayerTurn;
    self.statusLabel.text = @"X to move";
    [self.theGameState.boardState removeAllObjects];
    for (int i=0; i<9; i++) {
        [self.theGameState.boardState insertObject:@" " atIndex:i];
    }
    [self updateBoard];
}

-(void)updateBoard {
    for (int i=0; i<9; i++) {
        if ([[self.theGameState.boardState objectAtIndex:i] isEqualToString:@"x"]) {
            [[self.spaceButton objectAtIndex:i] setImage:self.xImage forState:UIControlStateNormal];
        } else if ([self.theGameState.boardState[i] isEqualToString:@"o"]) {
            [self.spaceButton[i] setImage:self.oImage forState:UIControlStateNormal];
        } else {
            [self.spaceButton[i] setImage:nil forState:UIControlStateNormal];
        }
    }
}

-(BOOL)didPlayerWin:(NSString *)player {
    if (([self.theGameState.boardState[0] isEqualToString:player] &&
         [self.theGameState.boardState[1] isEqualToString:player] &&
         [self.theGameState.boardState[2] isEqualToString:player]) ||
        ([self.theGameState.boardState[3] isEqualToString:player] &&
         [self.theGameState.boardState[4] isEqualToString:player] &&
         [self.theGameState.boardState[5] isEqualToString:player]) ||
        ([self.theGameState.boardState[6] isEqualToString:player] &&
         [self.theGameState.boardState[7] isEqualToString:player] &&
         [self.theGameState.boardState[8] isEqualToString:player] )) {
        return YES;
    }
    if (([self.theGameState.boardState[0] isEqualToString:player] &&
         [self.theGameState.boardState[3] isEqualToString:player] &&
         [self.theGameState.boardState[6] isEqualToString:player]) ||
        ([self.theGameState.boardState[1] isEqualToString:player] &&
         [self.theGameState.boardState[4] isEqualToString:player] &&
         [self.theGameState.boardState[7] isEqualToString:player]) ||
        ([self.theGameState.boardState[2] isEqualToString:player] &&
         [self.theGameState.boardState[5] isEqualToString:player] &&
         [self.theGameState.boardState[8] isEqualToString:player] )) {
        return YES;
    }
    if (([self.theGameState.boardState[0] isEqualToString:player] &&
         [self.theGameState.boardState[4] isEqualToString:player] &&
         [self.theGameState.boardState[8] isEqualToString:player]) ||
        ([self.theGameState.boardState[2] isEqualToString:player] &&
         [self.theGameState.boardState[4] isEqualToString:player] &&
         [self.theGameState.boardState[6] isEqualToString:player])) {
            return YES;
        }
    return NO;
}

-(TTGameOverStatus)checkGameOver {
    if ([self didPlayerWin:@"x"]) {
        return TTGameOverxWins;
    } else if ([self didPlayerWin:@"o"]) {
        return TTGameOveroWins;
    }
    
    for (int i=0; i<9; i++) {
        if ([self.theGameState.boardState[i] isEqualToString:@" "]) {
            return TTGameNotOver;
        }
    }
    return TTGameOverTie;
}

-(void)updateGameStatus {
    TTGameOverStatus gameOverStatus = [self checkGameOver];
    switch (gameOverStatus) {
            case TTGameNotOver:
            if (self.theGameState.playersTurn == TTxPlayerTurn) {
                self.statusLabel.text = @"X to Move";
            } else {
                self.statusLabel.text = @"O to Move";
            }
            break;
            case TTGameOverxWins:
            case TTGameOveroWins:
            case TTGameOverTie:
            [self endGameWithResult:gameOverStatus];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)spaceButtonPressed:(UIButton *)sender {
    int spaceIndex = sender.tag;
    if ([self.theGameState.boardState[spaceIndex] isEqualToString:@" "] && self.myShape == self.theGameState.playersTurn) {
        if (self.theGameState.playersTurn == TTxPlayerTurn) {
            [self.theGameState.boardState replaceObjectAtIndex:spaceIndex withObject:@"x"];
            self.theGameState.playersTurn = TToPlayerTurn;
        } else {
            [self.theGameState.boardState replaceObjectAtIndex:spaceIndex withObject:@"o"];
            self.theGameState.playersTurn = TTxPlayerTurn;
        }
        [self updateBoard];
        [self updateGameStatus];
        
        NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:self.theGameState];
        NSError *error;
        [self.theSession sendDataToAllPeers:theData withDataMode:GKSendDataReliable error:&error];
    }
}

-(void)endGameWithResult:(TTGameOverStatus)result {
    NSString *gameOverMessage;
    if (result == TTGameOverxWins) {
        gameOverMessage = @"X wins";
    } else if (result == TTGameOveroWins) {
        gameOverMessage = @"O wins";
    } else if (result == TTGameOverTie) {
        gameOverMessage = @"Tie game";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:gameOverMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self initGame];
}

#pragma mark - GameKit delegate
-(void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session {
    self.theSession = session;
    self.myPeerID = peerID;
    [session setDataReceiveHandler:self withContext:nil];
    [picker dismiss];
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:self.myUUID];
    NSError *error;
    [self.theSession sendDataToAllPeers:theData withDataMode:GKSendDataReliable error:&error];
}
-(void)receiveData:(NSData*)data fromPeer:(NSString*)peer inSession:(GKSession*)session context:(void*)context {
    if (myShape == TTMyShapeUndefined) {
        NSString *peerUUID = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if ([myUUID compare:peerUUID] == NSOrderedAscending) {
            myShape = TTMyShapeX;
            self.playerLabel.text = @"You are X";
        } else {
            myShape = TTMyShapeO;
            self.playerLabel.text = @"You are O";
        }
    } else {
        self.theGameState = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [self updateBoard];
        [self updateGameStatus];
    }
}

@end
