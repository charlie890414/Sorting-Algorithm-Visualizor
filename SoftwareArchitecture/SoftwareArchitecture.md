# Architecture
---
## Datas
### File
1. Episodes.txt(Need more specific description)  
stored data of default 19 episodes.
2. Records.txt(Need more specific description)  
stored player historical game data.
3. MenuCursor  
A integer stored the position of menu cursor.
4. EpisodeData(Need more specific description)  
temporally stored user choosen episode information.
5. CurrentGameState  
temporally stored information about current game state.
this data has more initial information than _EpisodeData_, because user have some operation, and it decide some initial data.
6. GameStoppedState  
A integer indicate the state of game. If this value is not zero, then game is stop. If this value is zero, then the game is running.  
7. StoppedPageCursor  
A integer stored the position of stopped page cursor.
8. ConfirmPageCursor  
A integer indicate the state of confirm of user. If this value is not zero, then confirm is yes. If this value is zero, then the confirm is no.  
9.  
---
## UIs
### Menu
1. Enter: into episode.
2. up:  cursor up.
3. down: cursor down.
4. right: cursor right.
5. left: cursor left.  
Has 20 button, each button represent a episode.
each row has 4 button.
whole page has 5 rows.
pre-19 button is default episodes, and the last one is random scheme.

### Game Scheme
//to-do
### Stopped Page
1. Enter: go to choosen state.
2. right: cursor right.
3. left: cursor left.  
Has 3 button, respectively from left to right are Restart, Home(go to Menu), Run. 

### Confirm Page
1. Enter: go to choosen state.
2. right: cursor right.
3. left: cursor left.  
Has 2 button, respectively from left to right are No and Yes.  
---
## States
Menu: 1  
NewGame: 2  
GamePlaying: 3  
StoppedPage: 4  
RestartConfirmPage: 5  
HomeConfirmPage: 6
## Functions
1. DrawMenuPicture(start->1 || 6->1)
Uses: when state go to "Menu".
Implementation: read _MenuCursor_ and _Records.txt_, and draw picture on pane .  
2. ChangeMenuCursor(X)  
Uses: when user change menu cursor.
Implementation: change _MenuCursor_, and call _DrawMenuPicture_.  
3. EnterEpisode(X)  
Uses: When user clicked enter episode button in Menu, call this function.  
Implementation: read the _Episodes.txt_, extract data from specific episode.  
And stored Extracted data in _EpisodeData_. And set _MenuCursor_ to initial state. 
And call _NewGame_.   
4. NewGame(1->2 ||  5->2)  
Uses: When developer want to create a new game.  
Implementation: use _CurrentGameState_ read data from the _EpisodeData_.  
And call function _DrawGamePlayingPicture_.  
5. DrawGamePlayingPicture(X)  
Uses: each time refresh the state, then you need to call this function.  
Implementation: draw picture on pane by reading data from _CurrentGameState_.
6. NextSatus(X)  
Uses: go to next state when playing game(decide by _GameStoppedState_).  
Implementation: read data from _CurrentGameState_, compute next state by Physic Engine, and store result to _CurrentGameState_.  
WARNING: THIS FUNCTION IS HARD TO CODE.  
7. StopGame(3->4)
Uses: each time user stopped game, then you need to call this function.  
Implementation: change _GameStoppedState_, And call function _DrawStoppedPagePicture_.    
8. DrawStoppedPagePicture(X)
Uses: when stop button clicked.
Implementation: read _StoppedPageCursor_, and draw picture on pane .  
9. ChangeStoppedPageCursor(X)  
Uses: when user change stopped page cursor.
Implementation: change _StoppedPageCursor_, and call _DrawStoppedPagePicture_.
10. DrawConfirmPagePicture(4->5 || 4->6)
Uses: when home or restart button clicked.
Implementation: read _ConfirmPageCursor_, and draw picture on pane .  
11. ChangeConfirmPageCursor(X)  
Uses: when user change confirm page cursor.
Implementation: change _ConfirmPageCursor_, and call _DrawConfirmPagePicture_.
12. (2->3)
13. RunGame(4->3)  
Uses: each time user rerun the game, then you need to call this function.  
Implementation: change _GameStoppedState_, And call function _DrawGamePlayingPicture_.    
14. EnterNo(5->4 || 6->4)  
Uses: when no button clicked.
Implementation: call _DrawStoppedPagePicture_.  
15. 