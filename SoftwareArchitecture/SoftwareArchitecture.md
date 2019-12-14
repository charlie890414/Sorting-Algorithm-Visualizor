# Architecture
---
## Datas
### File
1. Episodes.txt(Need more specific description)  
stored data of default 19 episodes.
2. Records.txt(Need more specific description)  
stored player historical game data.
3. ChoosenEpisode  
A integer stored the position of cursor.
4. EpisodeData(Need more specific description)  
temporally stored user choosen episode information.
5. CurrentGameStatus  
temporally stored information about current game status.
this data has more initial information than _EpisodeData_, because user have some operation, and it decide some initial data.
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
## Functions
1. ChangeChoosenEpisode  
Uses: when user change cursor.
Implementation: change _ChoosenEpisode_, and redraw the pane.  
2. ClickEpisode  
Uses: When user clicked episode button in Menu, call this function.  
Implementation: read the _Episodes.txt_, extract data from specific episode.  
And stored Extracted data in _EpisodeData_.  
3. NewGame
Uses: When developer want to create a new game.  
Implementation: use _CurrentGameStatus_ read data from the _EpisodeData_.  
And call function _Draw_.  
4. Draw
Uses: each time refresh the status, then you need to call this function.
Implementation: draw picture on pane by reading data from _CurrentGameStatus_.
