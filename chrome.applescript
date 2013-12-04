#!/usr/bin/env osascript

-- Open new window to google play music
on openWindow()
  tell application "Google Chrome"
    activate
    set newWin to make new window
    tell active tab of newWin to set URL to "http://play.google.com/music"
  end tell
end openWindow

-- Does action to google play music window.
-- Returns true if google play music window is open, false otherwise
on sendAction(action)
  tell application "Google Chrome"
    -- Pause the track
    repeat with w in (every window)
      repeat with t in (every tab whose URL contains "play.google.com/music") of w
		  
		if action = "prevSong" then
        		tell t to execute javascript "(document.getElementsByClassName('flat-button')[1]).click();"
		end if
		
		if action = "playPause" then
        		tell t to execute javascript "(document.getElementsByClassName('flat-button')[2]).click();"
		end if
		
		if action = "nextSong" then
        		tell t to execute javascript "(document.getElementsByClassName('flat-button')[3]).click();"
		end if
		
		if action = "like" then
        		tell t to execute javascript "($('li', document.getElementsByClassName('rating-container thumbs')[0])[0]).click();"
		end if
		
		if action = "dislike" then
        		tell t to execute javascript "($('li', document.getElementsByClassName('rating-container thumbs')[0])[1]).click();"
		end if
		
        return true
      end repeat
    end repeat
  end tell
  return false
end sendAction

on run argv
  set action to "playPause"
  if count of argv is greater than 0 then
    set action to item 1 of argv
  end if
  if sendAction(action) is false and action is "playPause" then
    openWindow()
  end if
end run
